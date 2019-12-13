using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using Microsoft.AspNet.SignalR;

namespace MyWebsite
{
    
    public class NotificationHub : Hub
    {
        public void Send(string UserName)
        {
           
            // Call the broadcastMessage method to update clients.
            Clients.Group(UserName).Mess();
        }
        public void Join(string UserName)
        {
            Groups.Add(Context.ConnectionId, UserName);
        }
        public void JoinLogin()
        {
            Groups.Add(Context.ConnectionId, "LoginGroup");
        }
        public void Sendagain(string UserName,string content)
        {
            Clients.OthersInGroup(UserName).Mess1(content);
        }
    }
}