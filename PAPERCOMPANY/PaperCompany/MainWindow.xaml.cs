using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Windows;

namespace PaperCompany
{
    /// <summary>
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
            try
            {
                List<Agent> list = PaperCompanyEntities1.GetContext().Agent.ToList();
                SqlConnection connection = new SqlConnection("Data Source=localhost;Initial Catalog=PaperCompany;Integrated Security=True");


                foreach (Agent item in list)
                {
                    SqlCommand sqlcmd = new SqlCommand($"(SELECT SUM(ProductCount) FROM dbo.ProductSale WHERE AgentID = {item.ID} AND YEAR(dbo.ProductSale.SaleDate) = {Convert.ToInt32(DateTime.Now.Year)} )", connection);
                    connection.Open();
                    item.PtdSale = sqlcmd.ExecuteScalar().ToString();
                    connection.Close();
                }


                try
                {
                    foreach (var item in list)
                    {
                        SqlCommand sqlcmd = new SqlCommand($"(SELECT SUM(ProductCount) FROM dbo.ProductSale WHERE AgentID = {item.ID})", connection);
                        connection.Open();
                        int sale = Convert.ToInt32(sqlcmd.ExecuteScalar().ToString());
                        connection.Close();
                        if (sale > 500000)
                        {
                            item.Discount = "25";
                        }
                        else if (sale > 149999)
                        {
                            item.Discount = "20";
                        }
                        else if (sale > 49999)
                        {
                            item.Discount = "10";
                        }
                        else if (sale > 4999)
                        {
                            item.Discount = "5";
                        }
                        else if (sale > 9999)
                        {
                            item.Discount = "0";
                        }
                        else
                        {
                            item.Discount = "0";
                        }
                    }
                }
                catch (Exception)
                {
                    MessageBox.Show("Отсутствуют записи продаж нескольких агентов на текущий год", "Ошибка", MessageBoxButton.OK);
                }
                listAgents.ItemsSource = list;
            }
            catch (Exception)
            {
                MessageBox.Show("Отсутствует доступ к БД", "Ошибка", MessageBoxButton.OK);
            }
        }

        private void TBoxSearch_TextChanged(object sender, System.Windows.Controls.TextChangedEventArgs e)
        {

        }
    }
}
