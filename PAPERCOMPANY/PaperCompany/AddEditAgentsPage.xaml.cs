﻿using Microsoft.Win32;
using System;
using System.Collections.Generic;
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
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace PaperCompany
{
    /// <summary>
    /// Interaction logic for AddEditAgentsPage.xaml
    /// </summary>
    public partial class AddEditAgentsPage : Page
    {
        public Agent Agent { get; set; }
        public bool bCreate;
        public AddEditAgentsPage(Agent agent)
        {
            InitializeComponent();

            bCreate = agent == null;

            if (bCreate)
            {
                Agent = new Agent();
                Agent.AgentType = PaperCompanyEntities1.GetContext().AgentType.First();
                Agent.AgentTypeID = Agent.AgentType.ID;

                HistoryGrid.Visibility = Visibility.Hidden;
                DeleteButton.Visibility = Visibility.Hidden;
            }
            else
            {
                Agent = agent;
            }


            DataContext = Agent;

            var types = PaperCompanyEntities1.GetContext().AgentType.ToList().Select(p => p.Title).ToList();
            int index = 0;

            if (!bCreate)
            {
                index = types.FindIndex(p => p == Agent.AgentType.Title);
            }

            AgentType.ItemsSource = types;
            AgentType.SelectedIndex = index;

            HistoryGrid.ItemsSource = Agent.ProductSale;
        }

        private void BackButton_Click(object sender, RoutedEventArgs e)
        {
            Manager.MainFrame.GoBack();
        }

        private bool CheckToCreateNewAgent()
        {
            if (string.IsNullOrEmpty(Agent.Title) ||
                string.IsNullOrEmpty(Agent.Address) ||
                string.IsNullOrEmpty(Agent.INN) ||
                string.IsNullOrEmpty(Agent.KPP) ||
                string.IsNullOrEmpty(Agent.DirectorName) ||
                string.IsNullOrEmpty(Agent.Phone) ||
                string.IsNullOrEmpty(Agent.Email)
                )
            {
                return false;
            }
            return true;
        }

        private void SaveButton_Click(object sender, RoutedEventArgs e)
        {
            if (bCreate)
            {
                if (!CheckToCreateNewAgent())
                {
                    MessageBox.Show("Вы не заполнили все поля");
                    return;
                }
            }

            if (Agent.Priority <= 0)
            {
                MessageBox.Show("Приоритет должен быть больше 0");
                return;
            }

            if (bCreate)
            {
                PaperCompanyEntities1.GetContext().Agent.Add(Agent);
            }
            else
            {
                var NewAgent = PaperCompanyEntities1.GetContext().Agent.Where(p => p.ID == Agent.ID).First();
                NewAgent.Title = Agent.Title;
                NewAgent.AgentTypeID = Agent.AgentTypeID;
                NewAgent.Priority = Agent.Priority;
                NewAgent.Address = Agent.Address;
                NewAgent.INN = Agent.INN;
                NewAgent.KPP = Agent.KPP;
                NewAgent.DirectorName = Agent.DirectorName;
                NewAgent.Phone = Agent.Phone;
                NewAgent.Email = Agent.Email;
            }

            PaperCompanyEntities1.GetContext().SaveChanges();

            MessageBox.Show("Вы успешно сохранили изменения");
        }

        private void DeleteHistoryButton_Click(object sender, RoutedEventArgs e)
        {
            var History = HistoryGrid.SelectedItem as ProductSale;

            Agent.ProductSale.Remove(History);

            var NewAgent = PaperCompanyEntities1.GetContext().Agent.Where(p => p.ID == Agent.ID).SingleOrDefault();
            NewAgent.ProductSale = Agent.ProductSale;

            //rpm_secondEntities.GetContext().SaveChanges();

            Agent = NewAgent;

            HistoryGrid.ItemsSource = Agent.ProductSale;

        }

        private void AgentType_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            Agent.AgentTypeID = AgentType.SelectedIndex;
        }

        private void ChangeLogoButton_Click(object sender, RoutedEventArgs e)
        {

        }

        private void DeleteButton_Click(object sender, RoutedEventArgs e)
        {
            PaperCompanyEntities1.GetContext().AgentPriorityHistory.RemoveRange(Agent.AgentPriorityHistory);

            PaperCompanyEntities1.GetContext().Agent.Remove(Agent);
            PaperCompanyEntities1.GetContext().SaveChanges();

            MessageBox.Show("Вы успешно удалили агента " + Agent.Title);
            Manager.MainFrame.GoBack();

        }
    }
}
