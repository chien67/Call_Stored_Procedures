using System;
using System.Data.SqlClient;
using System.Text;

namespace Call_Stored_Procedures
{
    internal class Program
    {
        private static void Main(string[] args)
        {
            Console.OutputEncoding = Encoding.UTF8;
            //khai bao chuoi ket noi
            string connString = "Data Source=DESKTOP-RKU97QB\\SQLDEV;Initial Catalog=Test;User ID=sa;Password=Abcde@12354-";

            //Thêm mới
            using (SqlConnection conn = new SqlConnection(connString))
            {
                conn.Open();

                using (SqlCommand cmd = new SqlCommand("Usp_InsertUpdateDelete_Product", conn))
                {
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;

                    cmd.Parameters.Clear();

                    cmd.Parameters.AddWithValue("@ID", 1);
                    cmd.Parameters.AddWithValue("@Name", "Water");
                    cmd.Parameters.AddWithValue("@Production_Date", new DateTime(2022, 11, 16));
                    cmd.Parameters.AddWithValue("@Is_Error", true);
                    cmd.Parameters.AddWithValue("@Price", 100000);
                    cmd.Parameters.AddWithValue("@Address", "Ha Noi");
                    cmd.Parameters.AddWithValue("@Query", 1);

                    cmd.ExecuteNonQuery();
                }
            }

            //Select
            using (SqlConnection conn = new SqlConnection(connString))
            {
                conn.Open();

                using (SqlCommand cmd = new SqlCommand("Usp_InsertUpdateDelete_Product", conn))
                {
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;

                    cmd.Parameters.Clear();

                    cmd.Parameters.AddWithValue("@ID", 0);
                    cmd.Parameters.AddWithValue("@Name", DBNull.Value);
                    cmd.Parameters.AddWithValue("@Production_Date", DBNull.Value);
                    cmd.Parameters.AddWithValue("@Is_Error", DBNull.Value);
                    cmd.Parameters.AddWithValue("@Price", DBNull.Value);
                    cmd.Parameters.AddWithValue("@Address", DBNull.Value);
                    cmd.Parameters.AddWithValue("@Query", 4);

                    SqlDataReader reader = cmd.ExecuteReader();

                    if (reader.HasRows)
                    {
                        while (reader.Read())
                        {
                            int id = 0;
                            string name = "";
                            DateTime? Production_Date = null;
                            bool? Is_Error = null;
                            Decimal? Price = null;
                            string Address = "";
                            if (reader["id"] != DBNull.Value)
                            {
                                id = int.Parse(reader["id"].ToString());
                            }
                            if (reader["name"] != DBNull.Value)
                            {
                                name = reader["name"].ToString();
                            }
                            if (reader["Production_Date"] != DBNull.Value)
                            {
                                Production_Date = DateTime.Parse(reader["Production_Date"].ToString());
                            }
                            if (reader["Is_Error"] != DBNull.Value)
                            {
                                Is_Error = bool.Parse(reader["Is_Error"].ToString());
                            }
                            if (reader["Price"] != DBNull.Value)
                            {
                                Price = Decimal.Parse(reader["Price"].ToString());
                            }
                            if (reader["Address"] != DBNull.Value)
                            {
                                Address = reader["Address"].ToString();
                            }
                            Console.WriteLine("{0}\t{1}\t{2}\t{3}\t{4}\t{5}",id,name,Production_Date,Is_Error,Price,Address);
                        }
                    }
                    else
                    {
                        Console.WriteLine("No rows found.");
                    }
                    reader.Close();
                }
            }
            // lệnh dừng màn hình
            Console.ReadKey();
        }

        public static string GetString(object o)
        {
            if (o == DBNull.Value)
                return "";

            return o.ToString();
        }
    }
}