using System;
using System.Collections.Generic;
using System.Linq;
using System.Windows;
using System.Windows.Controls;
using System.Data.SqlClient;

namespace PaperCompany
{
    /// <summary>
    /// Interaction logic for AgentsPage.xaml
    /// </summary>
    public partial class AgentsPage : Page
    {
        public AgentsPage()
        {
            InitializeComponent();
            try
            {
                SqlConnection connection = new SqlConnection("Data Source=localhost;Initial Catalog=PaperCompany;Integrated Security=True");
                List<Agent> listAgents = PaperCompanyEntities1.GetContext().Agent.ToList();

                // Загружаем Типы Агентов для фильтрации
                var allTypes = PaperCompanyEntities1.GetContext().AgentType.Select(p => p.Title).ToList();
                allTypes.Insert(0, "Все типы");
                ComboBoxFiltration.ItemsSource = allTypes;
                ComboBoxFiltration.SelectedIndex = 0;

                // Указываем элементы для сортировки
                ComboBoxSorting.Items.Add("Наименование");
                ComboBoxSorting.Items.Add("Размер скидки");
                ComboBoxSorting.Items.Add("Приоритет агента");
                ComboBoxSorting.SelectedIndex = 0;

                // Вычисляем продажи за год каждого агента
                foreach (Agent selectedAgent in listAgents)
                {
                    SqlCommand sqlcmd = new SqlCommand($"(SELECT SUM(ProductCount) FROM dbo.ProductSale WHERE AgentID = {selectedAgent.ID} AND YEAR(dbo.ProductSale.SaleDate) = {Convert.ToInt32(DateTime.Now.Year)} )", connection);
                    connection.Open();                    
                    selectedAgent.PtdSale = sqlcmd.ExecuteScalar().ToString();
                    if (selectedAgent.PtdSale == "")
                        selectedAgent.PtdSale = "0";
                    connection.Close();
                }

                // Вычисляем скидку каждого агента
                foreach (var selectedAgent in listAgents)
                {
                    SqlCommand sqlcmd = new SqlCommand($"(SELECT SUM(ProductCount) FROM dbo.ProductSale WHERE AgentID = {selectedAgent.ID})", connection);
                    connection.Open();
                    int allSales = Convert.ToInt32(sqlcmd.ExecuteScalar());
                    connection.Close();

                    if (allSales > 500000)
                        selectedAgent.Discount = "25";
                    else if (allSales > 149999)
                        selectedAgent.Discount = "20";
                    else if (allSales > 49999)
                        selectedAgent.Discount = "10";
                    else if (allSales > 9999)
                        selectedAgent.Discount = "5";
                    else
                        selectedAgent.Discount = "0";
                }

                ListAgents.ItemsSource = listAgents;
            }
            catch (Exception ex)
            {
                //MessageBox.Show(ex.ToString());
                MessageBox.Show("Что-то пошло не так!", "Ошибка", MessageBoxButton.OK);
            }        
        }

        private void UpdateAgents(string filterSelect)
        {
            var currentAgents = PaperCompanyEntities1.GetContext().Agent.ToList();

            if (ComboBoxFiltration.SelectedIndex > 0)
                currentAgents = currentAgents.Where(p => p.AgentType.Title.Contains(ComboBoxFiltration.SelectedItem as string)).ToList();

            currentAgents = currentAgents.Where(p => p.Title.ToLower().Contains(TBoxSearch.Text.ToLower())).ToList();

            if (filterSelect == "Наименование")
                ListAgents.ItemsSource = currentAgents.OrderBy(p => p.Title).ToList();            
            else if (filterSelect == "Размер скидки")
                ListAgents.ItemsSource = currentAgents.OrderByDescending(p => p.Discount).ToList();
            else if (filterSelect == "Приоритет агента")
                ListAgents.ItemsSource = currentAgents.OrderByDescending(p => p.Priority).ToList();
            else
                ListAgents.ItemsSource = currentAgents.ToList();
        }

        private void TBoxSearch_TextChanged(object sender, System.Windows.Controls.TextChangedEventArgs e)
        {
            UpdateAgents(null);
        }   

        private void ComboBoxFiltration_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            UpdateAgents(null);
        }

        private void ComboBoxSorting_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            UpdateAgents(ComboBoxSorting.SelectedItem.ToString());
        }

        private void Page_IsVisibleChange(object sender, DependencyPropertyChangedEventArgs e)
        {
            if (Visibility == Visibility.Visible)
            {
                PaperCompanyEntities1.GetContext().ChangeTracker.Entries().ToList().ForEach(p => p.Reload());
                ListAgents.ItemsSource = PaperCompanyEntities1.GetContext().Agent.ToList();
            }
        }

        private void AddAgentButton_Click(object sender, RoutedEventArgs e)
        {
            Manager.MainFrame.Navigate(new AddEditAgentsPage(null));
        }

        private void BackBtn_Click(object sender, RoutedEventArgs e)
        {
            Manager.MainFrame.GoBack();
        }
    }
}
