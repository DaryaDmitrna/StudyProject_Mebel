using Aspose.Words;
using MebelCourseWPF.Models;
using Microsoft.EntityFrameworkCore;
using Microsoft.Win32;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
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

namespace MebelCourseWPF
{
    /// <summary>
    /// Логика взаимодействия для DocumentWindow.xaml
    /// </summary>
    public partial class DocumentWindow : Window
    {
        int Index;
        public DocumentWindow(int index)
        {
            InitializeComponent();
            mebelContext context = new mebelContext();
            Index = context.Order.Where(or => or.Number == index.ToString()).First().IdOrder;
            var managers = context.Managers.Select(m => m.Name).ToList();
            managerBox.ItemsSource = managers;
        }

        private void FirstDoc(object sender, RoutedEventArgs e)
        {
            if (managerBox.SelectedItem != null)
            {
                Document doc = new Document();
                DocumentBuilder build = new DocumentBuilder(doc);
                mebelContext context = new mebelContext();

                var order = context.Order.Where(o => o.IdOrder == Index).First();
                var client = context.Client.Where(c => c.IdClient == order.IdClient).First();
                var listnp = context.NewProduct.Include(n => n.NewproductCharacter).Include(n => n.IdProductNavigation).Where(n => n.IdOrder == Index).ToList();
                var manager = context.Managers.Where(m => m.IdManager == managerBox.SelectedIndex + 1).First();

                build.Writeln("Товарная накладная");
                build.Writeln("Исполнитель: Мебельная Фабрика Цитадель");
                build.Writeln($"Заказчик: {client.Name}");
                build.Writeln($"Заказ номер {order.Number}");

                var table = build.StartTable();
                build.InsertCell();
                table.AutoFit(Aspose.Words.Tables.AutoFitBehavior.AutoFitToContents);
                build.CellFormat.VerticalAlignment = Aspose.Words.Tables.CellVerticalAlignment.Center;
                build.Writeln("Товар");
                build.InsertCell();
                build.Writeln("Стоимость");
                build.EndRow();
                foreach (var np in listnp)
                {
                    build.InsertCell();
                    build.Writeln($"{np.IdProductNavigation.Name}");
                    build.InsertCell();
                    build.Writeln($"{np.IdProductNavigation.Price}");
                    build.EndRow();
                    build.InsertCell();
                    foreach (var npc in np.NewproductCharacter)
                    {
                        var charac = context.Character.Where(c => c.IdCharacter == npc.IdCharacter).First();
                        var parametr = context.Parametr.Where(p => p.IdParametr == npc.IdParametr).First();
                        build.Writeln($"{charac.Name} - {parametr.Name}");
                    }
                    build.InsertCell();
                    foreach (var npc in np.NewproductCharacter)
                    {
                        var parametr = context.Parametr.Where(p => p.IdParametr == npc.IdParametr).First();
                        build.Writeln($"{parametr.Price}");
                    }
                    build.EndRow();
                }
                build.EndTable();

                build.Writeln("Исполнитель: Мебельная Фабрика Цитадель");
                build.Writeln("Адрес: г.Екатеринбург ул.Ленина дом 10");
                build.Writeln("ИНН: 661234567890");
                build.Writeln($"Менеджер {manager.Name}");
                build.Writeln("Подпись_________________");
                build.Writeln($"Заказчик: {client.Name}");
                build.Writeln($"Адрес: {client.Adres}");
                build.Writeln($"Телефон: {client.Phone}");
                build.Writeln("Подпись_________________");

                doc.Save("tovar_naklad.docx");
                SaveFileDialog save = new SaveFileDialog();
                save.Filter = "Word Document|*.doc";
                save.ShowDialog();
                string newWay = save.FileName;
                string docWay = "tovar_naklad.docx";
                File.Copy(docWay, newWay);
            }
            else
            {
                MessageBox.Show("Выберите действующего менеждера");
            }
        }

        private void SecondDoc(object sender, RoutedEventArgs e)
        {
            if (managerBox.SelectedItem != null)
            {
                Document doc = new Document();
                DocumentBuilder build = new DocumentBuilder(doc);
                mebelContext context = new mebelContext();

                var order = context.Order.Where(o => o.IdOrder == Index).First();
                var client = context.Client.Where(c => c.IdClient == order.IdClient).First();
                var listnp = context.NewProduct.Include(n => n.NewproductCharacter).Include(n => n.IdProductNavigation).Where(n => n.IdOrder == Index).ToList();
                var manager = context.Managers.Where(m => m.IdManager == managerBox.SelectedIndex + 1).First();

                build.Writeln("Акт об оказании услуг");
                build.Writeln("Исполнитель: Мебельная Фабрика Цитадель");
                build.Writeln($"Заказчик: {client.Name}");

                var table = build.StartTable();
                build.InsertCell();
                table.AutoFit(Aspose.Words.Tables.AutoFitBehavior.AutoFitToContents);
                build.CellFormat.VerticalAlignment = Aspose.Words.Tables.CellVerticalAlignment.Center;
                build.Writeln("Товар");
                build.InsertCell();
                build.Writeln("Стоимость");
                build.EndRow();
                foreach (var np in listnp)
                {
                    build.InsertCell();
                    build.Writeln($"{np.IdProductNavigation.Name}");
                    build.InsertCell();
                    build.Writeln($"{np.IdProductNavigation.Price}");
                    build.EndRow();
                    build.InsertCell();
                    foreach (var npc in np.NewproductCharacter)
                    {
                        var charac = context.Character.Where(c => c.IdCharacter == npc.IdCharacter).First();
                        var parametr = context.Parametr.Where(p => p.IdParametr == npc.IdParametr).First();
                        build.Writeln($"{charac.Name} - {parametr.Name}");
                    }
                    build.InsertCell();
                    foreach (var npc in np.NewproductCharacter)
                    {
                        var parametr = context.Parametr.Where(p => p.IdParametr == npc.IdParametr).First();
                        build.Writeln($"{parametr.Price}");
                    }
                    build.EndRow();
                }
                build.InsertCell();
                build.Writeln("Сумма всего заказа:");
                build.InsertCell();
                build.Writeln($"{order.Sum}");
                build.EndRow();
                build.InsertCell();
                build.Writeln("Предоплата:");
                build.InsertCell();
                build.Writeln($"{order.Prepayment}");
                build.EndRow();
                build.InsertCell();
                build.Writeln("Остаток: ");
                build.InsertCell();
                build.Writeln($"{order.Sum - order.Prepayment}");
                build.EndRow();
                build.EndTable();

                build.Writeln("Доставка:");
                build.Writeln($"Адрес доставки: {client.Adres}");
                build.Writeln($"Дата доставки: {order.DateDeliver}");

                build.Writeln("Исполнитель: Мебельная Фабрика Цитадель");
                build.Writeln("Адрес: г.Екатеринбург ул.Ленина дом 10");
                build.Writeln("ИНН: 661234567890");
                build.Writeln($"Менеджер {manager.Name}");
                build.Writeln($"Телефон: {manager.Phone}");
                build.Writeln($"Почта: {manager.Email}");
                build.Writeln("Подпись_________________");
                build.Writeln($"Заказчик: {client.Name}");
                build.Writeln($"Адрес: {client.Adres}");
                build.Writeln($"Телефон: {client.Phone}");
                build.Writeln("Подпись_________________");

                if (order.Image != null)
                {
                    build.Writeln("Схема расположения производимой кухни:");
                    build.InsertImage($"Images/{order.Image}");
                }

                doc.Save("tovar_naklad.docx");
                SaveFileDialog save = new SaveFileDialog();
                save.Filter = "Word Document|*.doc";
                save.ShowDialog();
                string newWay = save.FileName;
                string docWay = "tovar_naklad.docx";
                File.Copy(docWay, newWay);
            }
            else
            {
                MessageBox.Show("Выберите действующего менеждера");
            }
        }
    }
}
