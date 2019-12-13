using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MyWebsite.ViewModels.TextBox;
using MyWebsite.Models;
namespace MyWebsite.Service.TextBox
{
    public class TextBoxService
    {
        readonly MyWebsiteEntities data = new MyWebsiteEntities();
        public bool AddNewTextBoxes(List<TextBoxModel> model)
        {
            try
            {
                foreach (var item in model)
                {
                    if (item.TextBoxId == 0)
                    {
                        Models.TextBox textbox = new Models.TextBox();
                        textbox.PageId = item.PageId;
                        textbox.Coordinate = item.Coordinate;
                        textbox.Degree = item.Degrees;
                        textbox.Height = item.Height;
                        textbox.Witdh = item.Witdh;
                        textbox.StatusActive = 0;
                        data.TextBoxes.Add(textbox);
                        data.SaveChanges();
                    }
                    else
                    {
                        Models.TextBox textBox = data.TextBoxes.SingleOrDefault(m => m.TextBoxId == item.TextBoxId);
                        if (item.StatusActive == 1)
                        {
                            textBox.StatusActive = 1;
                        }
                        else
                        {
                            textBox.Degree = item.Degrees;
                            textBox.Coordinate = item.Coordinate;
                           
                        }
                        data.SaveChanges();
                    }
                }
                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
        }
    }
}