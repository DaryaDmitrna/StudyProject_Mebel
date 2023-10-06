using Aspose.Words;
using MebelCourseWPF.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Remoting.Contexts;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;
using static Microsoft.EntityFrameworkCore.DbLoggerCategory;

namespace MebelCourseWPF
{
    /// <summary>
    /// Логика взаимодействия для ListWindow.xaml
    /// </summary>
    public partial class ListWindow : Window
    {
        Window mainWin;
        int status = 0;
        int page = 0;
        bool search = false;
        int numberPage = 1;
        public ListWindow(Window win)
        {
            InitializeComponent();
            mainWin = win;
        }

        private void Close(object sender, EventArgs e)
        {
            mainWin.Close();
        }

        private void Update(object sender, RoutedEventArgs e)
        {
            numberPage = 1;
            pageLab.Content = numberPage;
            page = 0;
            search = false;
            UpdateCode();
        }

        private void Search(object sender, RoutedEventArgs e)
        {
            page = 0;
            search = true;
            UpdateCode();
        }

        private void StatusSort(object sender, SelectionChangedEventArgs e)
        {
            page = 0;
            status = statusBox.SelectedIndex;
            UpdateCode();
        }

        public void UpdateCode()
        {
            var context = new mebelContext();
            var orders = context.Order
                .Where(or => or.IdStatus == 1 || or.IdStatus == 2 || or.IdStatus == 3 || or.IdStatus == 4 || or.IdStatus == 5)
                .Join(context.Client, or => or.IdClient, c => c.IdClient, (or, c) => new { Number = or.Number, Id = or.IdOrder, Client = c.Name, Accept = or.DateAccept, Execute = or.DateExacute, Deliver = or.DateDeliver, Prepayment = or.Prepayment, Sum = or.Sum, Status = or.IdStatus })
                .Join(context.Status, orc => orc.Status, s => s.IdStatus, (orc, s) => new { Number = orc.Number, Id = orc.Id, Client = orc.Client, Accept = orc.Accept, Execute = orc.Execute, Deliver = orc.Deliver, Prepayment = orc.Prepayment, Sum = orc.Sum, Status = s.Name });
            if (status == 0)
            {
                orders = context.Order
                .Where(or => or.IdStatus == 1 || or.IdStatus == 2 || or.IdStatus == 3 || or.IdStatus == 4 || or.IdStatus == 5)
                .Join(context.Client, or => or.IdClient, c => c.IdClient, (or, c) => new { Number = or.Number, Id = or.IdOrder, Client = c.Name, Accept = or.DateAccept, Execute = or.DateExacute, Deliver = or.DateDeliver, Prepayment = or.Prepayment, Sum = or.Sum, Status = or.IdStatus })
                .Join(context.Status, orc => orc.Status, s => s.IdStatus, (orc, s) => new { Number = orc.Number, Id = orc.Id, Client = orc.Client, Accept = orc.Accept, Execute = orc.Execute, Deliver = orc.Deliver, Prepayment = orc.Prepayment, Sum = orc.Sum, Status = s.Name });
            }
            else if (status == 7)
            {
                orders = context.Order
               .Join(context.Client, or => or.IdClient, c => c.IdClient, (or, c) => new { Number = or.Number, Id = or.IdOrder, Client = c.Name, Accept = or.DateAccept, Execute = or.DateExacute, Deliver = or.DateDeliver, Prepayment = or.Prepayment, Sum = or.Sum, Status = or.IdStatus })
               .Join(context.Status, orc => orc.Status, s => s.IdStatus, (orc, s) => new { Number = orc.Number, Id = orc.Id, Client = orc.Client, Accept = orc.Accept, Execute = orc.Execute, Deliver = orc.Deliver, Prepayment = orc.Prepayment, Sum = orc.Sum, Status = s.Name });
            }
            else
            {
                orders = context.Order
                .Where(or => or.IdStatus == status)
                .Join(context.Client, or => or.IdClient, c => c.IdClient, (or, c) => new { Number = or.Number, Id = or.IdOrder, Client = c.Name, Accept = or.DateAccept, Execute = or.DateExacute, Deliver = or.DateDeliver, Prepayment = or.Prepayment, Sum = or.Sum, Status = or.IdStatus })
                .Join(context.Status, orc => orc.Status, s => s.IdStatus, (orc, s) => new { Number = orc.Number, Id = orc.Id, Client = orc.Client, Accept = orc.Accept, Execute = orc.Execute, Deliver = orc.Deliver, Prepayment = orc.Prepayment, Sum = orc.Sum, Status = s.Name });
            }
            if (search)
            {
                string find = searchString.Text;
                if (searchBox.SelectedIndex == 0)
                {
                    orders = orders.Where(s => s.Number.Contains(find));
                }
                else if (searchBox.SelectedIndex == 1)
                {
                    orders = orders.Where(q => q.Client.Contains(find));
                }
                else
                {
                    MessageBox.Show("Выберите параметр");
                }
            }
            try
            {
                grid.DataContext = orders.Skip(page).Take(15).ToList();
                if (search)
                {
                    if (grid.Items.Count == 0)
                    {
                        MessageBox.Show("Ничего не найдено");
                    }
                }
            }
            catch (Microsoft.Data.SqlClient.SqlException)
            {
                MessageBox.Show("Не удалось связаться с базой данных");
            }
        }

        private void Add(object sender, RoutedEventArgs e)
        {
            CreateWindow win = new CreateWindow(false, 0);
            win.Show();
        }

        private void Change(object sender, RoutedEventArgs e)
        {
            if (grid.SelectedCells.Count > 0)
            {
                var cell = grid.SelectedCells[0];
                var info = cell.Column.GetCellContent(cell.Item);
                TextBlock tb = (TextBlock)info;
                int ind = int.Parse(tb.Text);
                CreateWindow win = new CreateWindow(true, ind);
                win.Show();
            }
            else
            {
                MessageBox.Show("Выберите заказ чтобы изменить");
            }
        }

        private void PrintDoc(object sender, RoutedEventArgs e)
        {
            if (grid.SelectedCells.Count > 0)
            {
                var cell = grid.SelectedCells[0];
                var info = cell.Column.GetCellContent(cell.Item);
                TextBlock tb = (TextBlock)info;
                int ind = int.Parse(tb.Text);
                DocumentWindow win = new DocumentWindow(ind);
                win.Show();
            }
            else
            {
                MessageBox.Show("Выберите заказ чтобы изменить");
            }
        }

        private void Back(object sender, RoutedEventArgs e)
        {
            if (page > 0)
            {
                page -= 15;
                numberPage--;
                pageLab.Content = numberPage;
                UpdateCode();
            }
        }

        private void Front(object sender, RoutedEventArgs e)
        {
            page += 15;
            numberPage++;
            pageLab.Content = numberPage;
            UpdateCode();
        }
    }
}
