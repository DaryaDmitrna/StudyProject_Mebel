using MebelCourseWPF.Models;
using Microsoft.EntityFrameworkCore;
using Microsoft.Win32;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
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
    /// Логика взаимодействия для CreateWindow.xaml
    /// </summary>
    public partial class CreateWindow : Window
    {
        Order newOrder;
        int indexProd = 0;
        int indexChar = 0;
        double SumTotal = 0;
        List<double> SumPar = new List<double>();
        bool newAdd = true;
        string imageName = "";
        bool Update = false;
        int idorder;
        Client newClient;
        public CreateWindow(bool update, int index)
        {
            InitializeComponent();
            DataContext = newClient = new Client();
            var context = new mebelContext();
            var products = context.Product.Select(p => $"{p.IdProduct} {p.Name}");
            var clients = context.Client.OrderBy(c => c.Name).Select(c => $"{c.IdClient} {c.Name}");
            productBox.ItemsSource = products.ToList();
            clientBox.ItemsSource = clients.ToList();
            newOrder = new Order();
            if (update)
            {
                Update = true;
                clientBox.IsEnabled = false;
                clientCheck.IsEnabled = false;
                idorder = context.Order.Where(or => or.Number == index.ToString()).First().IdOrder;
                var clientId = context.Order.Where(o => o.IdOrder == idorder).First().IdClient;
                newClient.Phone = context.Client.Where(c => c.IdClient == clientId).First().Phone;
                newOrder.DateAccept = context.Order.Where(o => o.IdOrder == idorder).First().DateAccept;
                newOrder.DateExacute = context.Order.Where(o => o.IdOrder == idorder).First().DateExacute;
                newOrder.DateDeliver = context.Order.Where(o => o.IdOrder == idorder).First().DateDeliver;
                newOrder.IdClient = context.Order.Where(o => o.IdOrder == idorder).First().IdClient;
                newOrder.Sum = context.Order.Where(o => o.IdOrder == idorder).First().Sum;
                newOrder.Prepayment = context.Order.Where(o => o.IdOrder == idorder).First().Prepayment;
                newOrder.IdStatus = context.Order.Where(o => o.IdOrder == idorder).First().IdStatus;
                newOrder.Image = context.Order.Where(o => o.IdOrder == idorder).First().Image;
                newOrder.Number = context.Order.Where(o => o.IdOrder == idorder).First().Number;
                var listNewProduct = context.NewProduct.Where(np => np.IdOrder == idorder).ToList();
                foreach (var np in listNewProduct)
                {
                    NewProduct newprod = new NewProduct();
                    newprod = np;
                    newprod.IdProductNavigation = context.Product.Where(p => p.IdProduct == np.IdProduct).First();
                    
                    var listNewproductCharacter = context.NewproductCharacter.Where(npc => npc.IdNewProduct == np.IdNewProduct).ToList();
                    foreach (var lnpc in listNewproductCharacter)
                    {
                        NewproductCharacter newchar = new NewproductCharacter();
                        newchar.IdCharacterNavigation = context.Character.Where(c => c.IdCharacter == lnpc.IdCharacter).First();
                        newchar.IdParametrNavigation = context.Parametr.Where(p => p.IdParametr == lnpc.IdParametr).First();
                        newchar.IdCharacterNavigation.Parametr = context.Parametr.Where(p => p.IdCharacter == lnpc.IdCharacterNavigation.IdCharacter).ToList();
                        newprod.NewproductCharacter.Add(lnpc);
                    }
                    newOrder.NewProduct.Add(newprod);
                }
                newOrder.IdClientNavigation = context.Client.Where(c => c.IdClient == newOrder.IdClient).First();
                nameText.Text = newOrder.IdClientNavigation.Name;
                phoneText.Text = newOrder.IdClientNavigation.Phone;
                addressText.Text = newOrder.IdClientNavigation.Adres;
                acceptDate.SelectedDate = newOrder.DateAccept;
                executeDate.SelectedDate = newOrder.DateExacute;
                deliverDate.SelectedDate = newOrder.DateDeliver;
                imageName = newOrder.Image;
                if (imageName != "" & imageName != null )
                {
                    imageOrder.Source = new BitmapImage(new Uri($"pack://siteoforigin:,,,/Images/{imageName}", UriKind.RelativeOrAbsolute));
                }
                var stats = context.Status.Select(s => s.Name);
                statusBox.ItemsSource = stats.ToList();
                statusBox.SelectedIndex = newOrder.IdStatus - 1;
            }
            else
            {
                acceptLab.Visibility = Visibility.Hidden;
                acceptDate.Visibility = Visibility.Hidden;
                executeLab.Visibility = Visibility.Hidden;
                executeDate.Visibility = Visibility.Hidden;
                deliverLab.Visibility = Visibility.Hidden;
                deliverDate.Visibility = Visibility.Hidden;
                statusLab.Visibility = Visibility.Hidden;
                statusBox.Visibility = Visibility.Hidden;
                nameText.IsEnabled = false;
                phoneText.IsEnabled = false;
                addressText.IsEnabled = false;
            }
            listProduct.SelectedIndex = 0;
            listProduct.ItemsSource = newOrder.NewProduct.ToList();
            SumCalk();
        }

        private void AddProduct(object sender, RoutedEventArgs e)
        {
            if (productBox.SelectedItem != null)
            {
                newAdd = true;
                var context = new mebelContext();
                NewProduct newProduct = new NewProduct();
                string item = productBox.SelectedItem.ToString();
                string index = "";
                for (int i = 0; i < item.Length; i++)
                {
                    if (item[i] == ' ')
                        break;
                    index = $"{index}{item[i]}";
                }
                newProduct.IdProductNavigation = context.Product.Where(p => p.IdProduct == int.Parse(index)).First(); 
                var charactersType = context.TypeChracter
                    .Join(context.Character, ct => ct.IdCharacter, c => c.IdCharacter, (ct, c) => new { IdType = ct.IdType, CharacterNavigation = ct.IdCharacterNavigation, IdCharacter = c.IdCharacter, Name = c.Name })
                    .Where(ctc => ctc.IdType == newProduct.IdProductNavigation.IdType).ToList();
                var parametersChar = context.Parametr.ToList().GroupBy(p => p.IdCharacter);
                foreach (var ct in charactersType)
                {
                    NewproductCharacter newChar = new NewproductCharacter();
                    newChar.IdCharacterNavigation = ct.CharacterNavigation;
                    foreach (var pc in parametersChar)
                    {
                        if (pc.Key == ct.IdCharacter)
                            newChar.IdParametrNavigation = pc.First();
                    }
                    newProduct.NewproductCharacter.Add(newChar);
                }
                newOrder.NewProduct.Add(newProduct);
                listProduct.ItemsSource = newOrder.NewProduct.ToList();
                SumCalk();
            }
        }

        private void CnahgeParametr(object sender, SelectionChangedEventArgs e)
        {
            if (!newAdd)
            {
                newOrder.NewProduct.ToList()[indexProd].NewproductCharacter.ToList()[indexChar].IdParametrNavigation =
                newOrder.NewProduct.ToList()[indexProd]
                .NewproductCharacter.ToList()[indexChar]
                .IdCharacterNavigation.Parametr.ToList()[((ComboBox)sender).SelectedIndex];
            }
            SumCalk();
        }
        private void ChangeIndexBox(object sender, MouseEventArgs e)
        {
            newAdd = false;
            if (listProduct.SelectedIndex >= 0)
            {
                indexProd = listProduct.SelectedIndex;
            }
            indexChar = int.Parse(((ComboBox)sender).Name[1].ToString());
        }
        
        private void SumCalk()
        {
            try
            {
                var newProducts = newOrder.NewProduct;
                SumTotal = 0;
                foreach (var np in newProducts)
                {
                    var chars = np.NewproductCharacter;
                    foreach (var c in chars)
                    {
                        SumTotal += (double)c.IdParametrNavigation.Price;
                    }
                    SumTotal += (double)np.IdProductNavigation.Price;
                }
            }
            finally
            {
                sumLab.Content = SumTotal;
                prepayLab.Content = (SumTotal * 0.3);
            }
        }

        private void DeleteProduct(object sender, RoutedEventArgs e)
        {
            newAdd = true;
            newOrder.NewProduct.Remove(newOrder.NewProduct.ToList()[listProduct.SelectedIndex]);
            listProduct.ItemsSource = newOrder.NewProduct.ToList();
            SumCalk();
        }

        private void ChangeIndexButton(object sender, MouseEventArgs e)
        {
            newAdd = false;
            if (listProduct.SelectedIndex >= 0)
            {
                indexProd = listProduct.SelectedIndex;
            }
        }

        private void NewClient(object sender, RoutedEventArgs e)
        {
            nameText.IsEnabled = true;
            phoneText.IsEnabled = true;
            addressText.IsEnabled = true;
            clientBox.IsEnabled = false;
        }

        private void OldClient(object sender, RoutedEventArgs e)
        {
            nameText.IsEnabled = false;
            phoneText.IsEnabled = false;
            addressText.IsEnabled = false;
            clientBox.IsEnabled = true;
        }

        private void AddImage(object sender, RoutedEventArgs e)
        {
            OpenFileDialog docWin = new OpenFileDialog();
            docWin.FileName = "Document";
            docWin.DefaultExt = ".txt";
            Nullable<bool> result = docWin.ShowDialog();
            if (result == true)
            {
                string fileName = docWin.FileName;
                string type = "";
                
                for (int i = fileName.Length - 1; i > 0; i--)
                {
                    if (fileName[i] == '.')
                        break;
                    type = $"{type}{fileName[i]}";
                }
                if (type == "gnp" || type == "gpj" || type == "gepj")
                {
                    string newFileName = Guid.NewGuid().ToString().Replace("-", "");
                    switch (type)
                    {
                        case "gnp": newFileName = newFileName + ".png";
                            break;
                        case "gpj":
                            newFileName = newFileName + ".jpg";
                            break;
                        case "gepj":
                            newFileName = newFileName + ".jpeg";
                            break;
                    }
                    string newWay = $"Images/{newFileName}";
                    File.Copy(fileName, newWay);
                    imageName = newFileName;
                    imageOrder.Source = new BitmapImage(new Uri($"pack://siteoforigin:,,,/Images/{imageName}", UriKind.RelativeOrAbsolute));
                }
                else
                {
                    MessageBox.Show("Поддерживаются только форматы 'png', 'jpg' и 'jpeg'");
                }
                
            }
        }

        private void Cencel(object sender, RoutedEventArgs e)
        {
            this.Close();
        }

        private void Save(object sender, RoutedEventArgs e)
        {
            var context = new mebelContext();
            bool isClient = false;
            if (newOrder.NewProduct.Count > 0)
            {
                if (Update)
                {
                    var res = MessageBox.Show("Вы уверены, что хотите изменить заказ?", "", MessageBoxButton.YesNo);
                    if (res == MessageBoxResult.Yes)
                    {
                        newOrder.DateAccept = (DateTime)acceptDate.SelectedDate;
                        if (executeDate.SelectedDate != null)
                        {
                            newOrder.DateExacute = executeDate.SelectedDate;
                        }
                        if (deliverDate.SelectedDate != null)
                        {
                            newOrder.DateDeliver = deliverDate.SelectedDate;
                        }
                        newOrder.Sum = (decimal)SumTotal;
                        newOrder.Prepayment = (decimal)(SumTotal * 0.3);
                        newOrder.Image = imageName;
                        var status = context.Status.Where(s => s.IdStatus == statusBox.SelectedIndex + 1).First();
                        newOrder.IdStatusNavigation = status;

                        var listnp = context.NewProduct.Where(np => np.IdOrder == idorder).ToList();
                        foreach (var np in listnp)
                        {
                            var listnpc = context.NewproductCharacter.Where(npc => npc.IdNewProduct == np.IdNewProduct).ToList();
                            foreach (var npc in listnpc)
                            {
                                var delnpc = context.NewproductCharacter.Where(dnpc => dnpc.IdNewProductCharacter == npc.IdNewProductCharacter).First();
                                context.Remove(delnpc);
                                context.SaveChanges();
                            }
                            var delnp = context.NewProduct.Where(dnp => dnp.IdNewProduct == np.IdNewProduct).First();
                            context.Remove(delnp);
                            context.SaveChanges();
                        }
                        var no = context.Order.Where(or => or.IdOrder == idorder).First();
                        context.Remove(no);
                        context.SaveChanges();

                        var cli = context.Client.Where(c => c.IdClient == newOrder.IdClient).First();
                        cli.Name = nameText.Text;
                        cli.Phone = phoneText.Text;
                        cli.Adres = addressText.Text;
                        context.Update(cli);
                        context.SaveChanges();
                        newOrder.IdClientNavigation = cli;

                        List<NewProduct> nplist = newOrder.NewProduct.ToList();
                        newOrder.NewProduct.Clear();
                        context.Add(newOrder);
                        context.SaveChanges();
                        foreach (var np in nplist)
                        {
                            NewProduct oneOfNewProd = new NewProduct();
                            oneOfNewProd.IdProduct = np.IdProductNavigation.IdProduct;
                            oneOfNewProd.IdOrder = context.Order.ToList().Last().IdOrder;
                            context.Add(oneOfNewProd);
                            context.SaveChanges();
                            var npclist = np.NewproductCharacter;
                            foreach (var npc in npclist)
                            {
                                NewproductCharacter oneOfNewProdChar = new NewproductCharacter();
                                oneOfNewProdChar.IdCharacter = npc.IdCharacterNavigation.IdCharacter;
                                oneOfNewProdChar.IdParametr = npc.IdParametrNavigation.IdParametr;
                                oneOfNewProdChar.IdNewProduct = context.NewProduct.ToList().Last().IdNewProduct;
                                context.Add(oneOfNewProdChar);
                                context.SaveChanges();
                            }
                        }
                        this.Close();
                    }
                }
                else
                {
                    var res = MessageBox.Show("Проверьте, вы всё правильно написали?", "", MessageBoxButton.YesNo);
                    if (res == MessageBoxResult.Yes)
                    {
                        if (clientCheck.IsChecked == true)
                        {
                            if (nameText.Text != "" & phoneText.Text != "" & addressText.Text != "")
                            {
                                Client client = new Client();
                                client.Name = nameText.Text;
                                client.Phone = phoneText.Text;
                                client.Adres = addressText.Text;
                                newOrder.IdClientNavigation = client;
                                isClient = true;
                            }
                            else
                            {
                                MessageBox.Show("Заполните все данные о клиете");
                            }
                        }
                        else
                        {
                            if (clientBox.SelectedItem != null)
                            {
                                string selectClient = clientBox.SelectedItem.ToString();
                                string index = "";
                                for (int i = 0; i < selectClient.Length; i++)
                                {
                                    if (selectClient[i] == ' ')
                                        break;
                                    index = $"{index}{selectClient[i]}";
                                }
                                var client = context.Client.Where(c => c.IdClient == int.Parse(index)).First();
                                newOrder.IdClientNavigation = client;
                                isClient = true;
                            }
                            else
                            {
                                MessageBox.Show("Введите клиента");
                            }
                        }
                        if (isClient)
                        {
                            if (imageName != "")
                            {
                                newOrder.Image = imageName;
                            }
                            newOrder.DateAccept = DateTime.Today;
                            var status = context.Status.Where(s => s.IdStatus == 1).First();
                            newOrder.IdStatusNavigation = status;
                            newOrder.Sum = (decimal)SumTotal;
                            newOrder.Prepayment = (decimal)(SumTotal * 0.3);
                            int lastInd = -1;
                            try
                            {
                                var nums = context.Order.Select(or => int.Parse(or.Number));
                                foreach (int i in nums)
                                {
                                    if (i > lastInd)
                                        lastInd = i;
                                }
                            }
                            catch(System.InvalidOperationException)
                            {
                                lastInd = 0;
                            }
                            lastInd++;
                            newOrder.Number = lastInd.ToString();
                            List<NewProduct> nplist = newOrder.NewProduct.ToList();
                            newOrder.NewProduct.Clear();
                            context.Add(newOrder);
                            context.SaveChanges();
                            foreach (var np in nplist)
                            {
                                NewProduct oneOfNewProd = new NewProduct();
                                oneOfNewProd.IdProduct = np.IdProductNavigation.IdProduct;
                                oneOfNewProd.IdOrder = context.Order.ToList().Last().IdOrder;
                                context.Add(oneOfNewProd);
                                context.SaveChanges();
                                var npclist = np.NewproductCharacter;
                                foreach (var npc in npclist)
                                {
                                    NewproductCharacter oneOfNewProdChar = new NewproductCharacter();
                                    oneOfNewProdChar.IdCharacter = npc.IdCharacterNavigation.IdCharacter;
                                    oneOfNewProdChar.IdParametr = npc.IdParametrNavigation.IdParametr;
                                    oneOfNewProdChar.IdNewProduct = context.NewProduct.ToList().Last().IdNewProduct;
                                    context.Add(oneOfNewProdChar);
                                    context.SaveChanges();
                                }
                            }
                        }
                        this.Close();
                    }
                }
            }
            else
            {
                var res = MessageBox.Show("В заказе нет товаров. Удалить его?", "", MessageBoxButton.YesNo);
                if (res == MessageBoxResult.Yes)
                {
                    if (Update)
                    {
                        var listnp = context.NewProduct.Where(np => np.IdOrder == idorder).ToList();
                        foreach (var np in listnp)
                        {
                            var listnpc = context.NewproductCharacter.Where(npc => npc.IdNewProduct == np.IdNewProduct).ToList();
                            foreach (var npc in listnpc)
                            {
                                var delnpc = context.NewproductCharacter.Where(dnpc => dnpc.IdNewProductCharacter == npc.IdNewProductCharacter).First();
                                context.Remove(delnpc);
                                context.SaveChanges();
                            }
                            var delnp = context.NewProduct.Where(dnp => dnp.IdNewProduct == np.IdNewProduct).First();
                            context.Remove(delnp);
                            context.SaveChanges();
                        }
                        var no = context.Order.Where(or => or.IdOrder == idorder).First();
                        context.Remove(no);
                        context.SaveChanges();
                    }
                    this.Close();
                }
            }
        }

        private void TextBox_Error(object sender, ValidationErrorEventArgs e)
        {
            if (e.Action == ValidationErrorEventAction.Added)
            {
                var errorToolTip = new ToolTip();
                errorToolTip.Content = e.Error.ErrorContent;
                (sender as TextBox).ToolTip = errorToolTip;
            }
        }
    }
}
