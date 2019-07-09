using System;
using System.Collections.Generic;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using Microsoft.ApplicationBlocks.Data;

namespace News
{



    public class NewsPaperBus
    {
        private NewsPaperData news = new NewsPaperData();

        public DataSet NewsPaperGetAll()
        {
            return news.NewsPaperGetAll();
        }
        public DataSet NewsGetByNewsPaper(int pIdNewsPaper)
        {
            return news.NewsGetByNewsPaper(pIdNewsPaper);
        }

        public DataRow NewsPaperGetById(int pIdNewsPaper)
        {
            return news.NewsPaperGetById(pIdNewsPaper);
        }
    }



}