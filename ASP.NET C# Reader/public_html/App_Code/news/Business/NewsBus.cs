using System;
using System.Collections.Generic;
using System.Text;
using System.Data;
using System.Data.SqlClient;

namespace News
{


    public class NewsBus
    {
        private NewsData news = new NewsData();

        public NewsBus()
        {
        }
        public int newsInsert(DataRow drNews)
        {
            return news.newsInsert(drNews);
        }
        public int newsInsert_FromWebSite(DataRow drNews)
        {
            return news.newsInsert_FromWebSite(drNews);
        }

        public DateTime? getMaxPublishedDate(int pIdNewsPaper, int pIdChannel)
        {
            return news.getMaxPublishedDate(pIdNewsPaper, pIdChannel);
        }

        public int countByTitle(int pIdNewsPaper, int pIdChannel, string title)
        {
            return news.countByTitle(pIdNewsPaper, pIdChannel, title);
        }
        

        public int newsReset()
        {
            return news.newsReset();
        }

        public DataSet newsGetAll()
        {
            return news.newsGetAll();
        }


        public DataSet NewsGetToExport(int cantidad)
        {
            return news.NewsGetToExport(cantidad);
        }
        
        public DataSet NewsToExportGetByDate(int pFecha)
        {
            return news.NewsToExportGetByDate(pFecha);
        }
        public int NewsExportDateUpdate(int publishData, int total) {
            return news.NewsExportDateUpdate(publishData, total);
        }
        public DataSet NewsGetExported()
        {
            return news.NewsGetExported();
        }
         

        public DataSet newsGetReport()
        {
            return news.newsGetReport();
        }
        

        public DataSet newsGetAllMayorId(int id)
        {
            return news.newsGetAllMayorId(id);
        }
        public DataSet News_GetChannelIdPorDescripcion(string value)
        {
            return news.News_GetChannelIdPorDescripcion(value);
        }

        

        public DataSet newsPaperUrl_GetAllEnabled()
        {
            return news.newsPaperUrl_GetAllEnabled();
        }

        public int newsLog_Insert(DataRow aDr)
        {
            return news.newsLog_Insert(aDr);
        }

    }



}