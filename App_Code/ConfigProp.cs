using System.Configuration;


public class ConfigProp
{
    public static string ConnectionString = ConfigurationManager.AppSettings["ConnectionString"];
}
