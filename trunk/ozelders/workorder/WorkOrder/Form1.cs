using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using System.Data.Sql;
using System.Data.SqlClient;
namespace WorkOrder
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            UserControl();
        }

        private void btnNewOrder_Click(object sender, EventArgs e)
        {
            NewOrder frmNewOrder = new NewOrder();
            frmNewOrder.Show();
            
        }

        private void button1_Click(object sender, EventArgs e)
        {
            UserEnter userEnterance = new UserEnter();
            userEnterance.Show();
            userEnterance.Disposed += new EventHandler(userEnterance_Disposed);
            
        }

        void userEnterance_Disposed(object sender, EventArgs e)
        {
            UserControl();
        }
        void UserControl()
        {
            if(Functions.LogedIn!=null)
            {
                lblUserName.Text = Functions.LogedIn.Name ;
                lblPosition.Text = Functions.LogedIn.Position.PositionTitle;
            }
        }
    }
}
