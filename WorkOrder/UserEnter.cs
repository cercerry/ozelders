using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using System.Data.SqlClient;
using System.Data.Sql;
namespace WorkOrder
{
    public partial class UserEnter : Form
    {
        public UserEnter()
        {
            InitializeComponent();
        }
        private void btnEnter_Click(object sender, EventArgs e)
        {
            WorkOrderEntities1 db = new WorkOrderEntities1();
            
            //Girilen bilgilere göre istedğimiz kullanıcıyı buluyoruz
            var NewEmployee = from emp in db.Employee
                              where emp.Name == txtName.Text && emp.Surname == txtSurname.Text && emp.Password == txtPassword.Text
                              select emp;
            List<Employee> employeeList = NewEmployee.ToList();
            //employee bulunduysa eğer bilgileri alıyoruz!
            if (employeeList.Count!= 0)
            {
                MessageBox.Show("Login successfull");
                Functions.LogedIn = employeeList.ElementAt(0);
                this.Close();

            }
            else
            {
                MessageBox.Show("Login failure!!!");
            }
        }

        private void UserEnter_Load(object sender, EventArgs e)
        {

        }
    }
}
