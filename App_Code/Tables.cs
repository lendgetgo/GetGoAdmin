using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
//using GetGoWeb.Models;
/// <summary>
/// Summary description for TBL_M_USER_MASTER
/// </summary>

public class Tables
{
    public class USER_MASTER
    {
        public int ID { get; set; }
        public string USER_ID { get; set; }
        public string FIRST_NAME { get; set; }
        public string MIDDLE_NAME { get; set; }
        public string LAST_NAME { get; set; }
        public string EXTENSION_NAME { get; set; }
        public int AGE { get; set; }
        public string DATE_OF_BIRTH { get; set; }
        public string SEX { get; set; }
        public string MARITAL_STATUS { get; set; }
        public string SPOUSE_NAME { get; set; }
        public string USERNAME { get; set; }
        public string PASSWORD { get; set; }
        public string EMAIL_ADDRESS { get; set; }
        public string CONTACTNO { get; set; }
        public string COMPANY_NAME { get; set; }
        public string REGION { get; set; }
        public string PROVINCE { get; set; }
        public string CITY { get; set; }
        public string BARANGAY { get; set; }
        public string STREET_NO { get; set; }
        public int ZIPCODE { get; set; }
        public string BUSSINESS_NAME { get; set; }
        public string NATURE_OF_WORK { get; set; }
        public string MONTHLY_GROSS { get; set; }
        public string CHARACTER_REFERENCE { get; set; }
        public string CO_GUARANTOR_NAME { get; set; }
        public string CO_GUARANTOR_NUMBER { get; set; }
        public string CREATED_BY { get; set; }
        public string UPDATED_BY { get; set; }

    }
}
