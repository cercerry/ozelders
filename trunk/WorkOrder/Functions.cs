using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace WorkOrder
{
    public class Functions
    {
        private static string _connStr = @"Data Source =SOYHAN\SQLExpress2008; Initial Catalog = WorkOrder; Integrated Security = SSPI;";
        public static string ConnStr
        {
            get { return Functions._connStr; }
            set { Functions._connStr = value; }
        }
        private static Employee _logedIn;
        public static Employee LogedIn
        {
            get { return Functions._logedIn; }
            set { Functions._logedIn = value; }
        }

    }
}
