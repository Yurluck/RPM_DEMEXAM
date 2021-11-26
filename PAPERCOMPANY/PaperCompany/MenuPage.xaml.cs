using System.Windows;
using System.Windows.Controls;

namespace PaperCompany
{
    /// <summary>
    /// Interaction logic for MenuPage.xaml
    /// </summary>
    public partial class MenuPage : Page
    {
        public MenuPage()
        {
            InitializeComponent();
        }

        private void AgentsPageBtn_Click(object sender, RoutedEventArgs e)
        {
            Manager.MainFrame.Navigate(new AgentsPage());
        }

        private void ProductsPageBtn_Click(object sender, RoutedEventArgs e)
        {
            Manager.MainFrame.Navigate(new ProductsPage());
        }
    }
}
