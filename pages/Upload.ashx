<%@ WebHandler Language="C#" Class="Upload" %>

using System;
using System.IO;
using System.Web;
using System.Data.SqlClient;
using System.Configuration;

public class Upload : IHttpHandler
{

    public void ProcessRequest(HttpContext context)
    {
        try
        {
            if (context.Request.Files.Count > 0)
            {
                string userId = System.Convert.ToString(context.Request.QueryString["USERID"]);
                string LoanId = System.Convert.ToString(context.Request.QueryString["LOANID"]);
                string classificationString = context.Request.Form["classification"]; // Get the classification string

                // Split the classification string into an array of individual classifications
                string[] classifications = classificationString.Split(',');

                for (int i = 0; i < context.Request.Files.Count; i++)
                {
                    HttpPostedFile postedFile = context.Request.Files[i];
                    string fileName = postedFile.FileName;
                    string fileExtension = Path.GetExtension(fileName);
                    //string filePath = HttpContext.Current.Server.MapPath(Path.Combine("~/UploadedFiles", userId));
                    string filePath = Path.Combine(ConfigurationManager.AppSettings["logfilesPath"], userId);
                    string classification = classifications[i];
                    if (!Directory.Exists(filePath))
                    {
                        Directory.CreateDirectory(filePath);
                    }

                    if (!string.IsNullOrEmpty(fileName))
                    {
                        string file = fileName;
                        postedFile.SaveAs(Path.Combine(filePath, file));
                        FileDetails fd = new FileDetails();
                        fd.UserId = userId;
                        fd.FileName = fileName;
                        fd.FileType = fileExtension;
                        fd.FilePath = Path.Combine(filePath, file); // Store the full file path
                        fd.Classification = classification;
                        SaveFiles(fd);
                    }
                }

                context.Response.Write("Files uploaded successfully");

            }
        }
        catch (Exception ex)

        {
            context.Response.StatusCode = 500; // Set an appropriate HTTP error code
            context.Response.Write("Error: " + ex.Message);
        }
    }

    public void SaveFiles(FileDetails fd)
    {
        try
        {
            var maint = new Maintenance();
            var parameters = new SqlParameter[]
            {
             new SqlParameter("@USER_ID", fd.UserId),
             new SqlParameter("@DESCRIPTION",fd.FileName),
             new SqlParameter("@IMAGE_TYPE",  fd.Classification),
            };
            //var parameters = new
            //{
            //    USER_ID = fd.UserId,
            //    DESCRIPTION = fd.FileName,
            //    IMAGE_TYPE = fd.Classification

            //};
            maint.QueryInsertOrUpdateAdoNet("APP_ATTACHMENT_POST", parameters);
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    //public void SaveFiles(FileDetails fd)
    //{
    //    try
    //    {
    //        var maint = new Upload_Maintenance();

    //        var commandText = @"INSERT INTO TBL_T_USER_LOAN_ATTACHMENT
    //                            (LOAN_ID,DESCRIPTION,TYPE,CREATED_DATE)
    //                      VALUES(@USERID,@DESCRIPTION,@TYPE,GETDATE())";
    //        var parameters = new
    //        {
    //            USERID = fd.UserId,
    //            DESCRIPTION = fd.FileName,
    //            TYPE = fd.Classification

    //        };
    //        maint.QueryInsertOrUpdateText(commandText, parameters);
    //    }
    //    catch (Exception ex)
    //    {
    //        throw ex;
    //    }
    //}



    public bool IsReusable
    {
        get
        {
            return false;
        }
    }
}