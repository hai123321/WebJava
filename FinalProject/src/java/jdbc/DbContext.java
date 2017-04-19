/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.naming.InitialContext;
import javax.sql.DataSource;

/**
 *
 * @author luyenchu
 */
public class DbContext {

    private InitialContext ctx = null;
    private Connection conn = null;
    private Statement st = null;

    public int executeUpdate(String sql) throws Exception {
        openConnection();
        try {
            return st.executeUpdate(sql);
        } finally {
            close();
        }
    }

    public ResultSet executeQuery(String sql) throws Exception {
        openConnection();
        return st.executeQuery(sql);

    }
    
    public PreparedStatement executeQueryPre(String query) throws Exception{
        try {
            openConnection();
            PreparedStatement preparedStatement = conn.prepareStatement(query);
            return preparedStatement;
        } catch (SQLException ex) {
            return null;
        }
    }

    public void close() {
        if (st != null) {
            try {
                st.close();
            } catch (Exception ignore) {
            }
        }
        if (conn != null) {
            try {
                conn.close();
            } catch (Exception ignore) {
            }
        }
    }

    private void openConnection() throws Exception {
        if (conn == null) {
            ctx = new InitialContext();
            DataSource ds = (DataSource) ctx.lookup("java:/comp/env/jdbc/ProjectQKH");
            conn = ds.getConnection();
            System.out.println("connection: " + conn);
            st = conn.createStatement();
        }
    }
    
    
}
