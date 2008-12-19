using System;
using System.Collections.Generic;
using System.Linq;
using System.Windows.Forms;

namespace WorkOrder
{
    public static class Program
    {
        /// <summary>
        /// The main entry point for the application.
        /// </summary>
        [STAThread]
        static void Main()
        {
            Application.EnableVisualStyles();
            Application.SetCompatibleTextRenderingDefault(false);
            Form1 FirstForm = new Form1();
            Application.Run(FirstForm);
        }
    }
}
