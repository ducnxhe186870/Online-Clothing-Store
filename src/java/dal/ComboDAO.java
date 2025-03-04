/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;
import java.sql.SQLException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import models.ComboDetails;
import models.ComboList;
import models.Product;

/**
 *
 * @author Asus
 */
public class ComboDAO {
    Connection conn = null;        // keets noois sql
    PreparedStatement ps = null;  // nems cau lenh query
    ResultSet rs = null;    // keet qua tra ve

    
    public List<ComboDetails> getComboDetail() {
       List<ComboDetails> list = new ArrayList<>();
        String query = "select comboID, [Combo Detail].proID, proName, proPrice from Product , [Combo Detail] where Product.proID = [Combo Detail].proID";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new ComboDetails(rs.getInt(1),
                        rs.getInt(2),
                        rs.getString(3),
                        rs.getFloat(4)
                )
                );
            }
        } catch (Exception e) {
        }
        return list;
    }
    
    
    public List<ComboList> getCombo() {
       List<ComboList> list = new ArrayList<>();
        String query = "select * from Combo";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new ComboList(rs.getInt(1),
                        rs.getString(2),
                        rs.getFloat(3),
                        rs.getBoolean(4)      
                )
                );
            }
        } catch (Exception e) {
        }
        return list;
    }
    
    
    
      public List<ComboDetails> getComboDetailByComboID(int comboID) {
       List<ComboDetails> list = new ArrayList<>();
        String query = "select comboID, [Combo Detail].proID, proName, proPrice from Product , [Combo Detail]"
                + " where Product.proID = [Combo Detail].proID  and comboID = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, comboID);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new ComboDetails(rs.getInt(1),
                        rs.getInt(2),
                        rs.getString(3),
                        rs.getFloat(4)
                )
                );
            }
        } catch (Exception e) {
        }
        return list;
    }
      
      public static void main(String[] args) {
          ComboDAO dao = new ComboDAO();
//          List<ComboDetails> list = new ArrayList<>();
//          list = dao.getComboDetailByComboID(2);
//          for (ComboDetails comboDetails : list) {
//              System.out.println(comboDetails.getProName());
//          }
          
          int a = dao.getIDCombo("combo11");
          System.out.println(a);
    }
    
  
      public List<Product> getListByPageNew(int index, int caid, String key) {
        List<Product> list = new ArrayList<>();
        // search
        String[] k = key.split("\\s");
        if(k.length>1){
            key = "";
            for(int i =0;i<k.length;i++){
                key+= "%" +k[i] +"%";
            }
            
        }else{
            key="%"+key+"";
        }
        String sql;
        if (caid == 0) {
            sql = "select * from Product where proName like '%" + key + "%'   order by proID OFFSET ? ROWS FETCH NEXT 6 ROWS ONLY;";
        } else {
            sql = "select * from Product where caID = ? and proName like '%" + key + "%'  order by proID OFFSET ? ROWS FETCH NEXT 6 ROWS ONLY;";
        }
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            if (caid == 0) {
                ps.setInt(1, (index - 1) * 6);
            } else {
                ps.setInt(1, caid);
                ps.setInt(2, (index - 1) * 6);
            }

            rs = ps.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setProID(rs.getInt("proID"));
                p.setProName(rs.getString("proName"));
                p.setProDetail(rs.getString("proDetail"));
                p.setProPrice(rs.getFloat("proPrice"));
                p.setCaID(rs.getInt("caID"));
                p.setProStatus(rs.getBoolean("proStatus"));
                list.add(p);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Product> getListByPageASC(int index, int caid, String key) {
        List<Product> list = new ArrayList<>();
        // search
        String[] k = key.split("\\s");
        if(k.length>1){
            key = "";
            for(int i =0;i<k.length;i++){
                key+= "%" +k[i] +"%";
            }
            
        }else{
            key="%"+key+"";
        }
        String sql;
        if (caid == 0) {
            sql = "select * from Product where proName like '%" + key + "%'  order by proPrice ASC OFFSET ? ROWS FETCH NEXT 6 ROWS ONLY;";
        } else {
            sql = "select * from Product where caID = ? and proName like '%" + key + "%'  order by proPrice ASC OFFSET ? ROWS FETCH NEXT 6 ROWS ONLY;";
        }
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            if (caid == 0) {
                ps.setInt(1, (index - 1) * 6);
            } else {
                ps.setInt(1, caid);
                ps.setInt(2, (index - 1) * 6);
            }
            rs = ps.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setProID(rs.getInt("proID"));
                p.setProName(rs.getString("proName"));
                p.setProDetail(rs.getString("proDetail"));
                p.setProPrice(rs.getFloat("proPrice"));
                p.setCaID(rs.getInt("caID"));
                p.setProStatus(rs.getBoolean("proStatus"));
                list.add(p);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Product> getListByPageDESC(int index, int caid, String key) {
        List<Product> list = new ArrayList<>();
        // search
        String[] k = key.split("\\s");
        if(k.length>1){
            key = "";
            for(int i =0;i<k.length;i++){
                key+= "%" +k[i] +"%";
            }
            
        }else{
            key="%"+key+"";
        }
        String sql;
        if (caid == 0) {
            sql = "select * from Product where proName like '%" + key + "%'  order by proPrice DESC OFFSET ? ROWS FETCH NEXT 6 ROWS ONLY;";
        } else {
            sql = "select * from Product where caID = ? and proName like '%" + key + "%'  order by proPrice DESC OFFSET ? ROWS FETCH NEXT 6 ROWS ONLY;";
        }
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            if (caid == 0) {
                ps.setInt(1, (index - 1) * 6);
            } else {
                ps.setInt(1, caid);
                ps.setInt(2, (index - 1) * 6);
            }
            rs = ps.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setProID(rs.getInt("proID"));
                p.setProName(rs.getString("proName"));
                p.setProDetail(rs.getString("proDetail"));
                p.setProPrice(rs.getFloat("proPrice"));
                p.setCaID(rs.getInt("caID"));
                p.setProStatus(rs.getBoolean("proStatus"));
                list.add(p);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }
    
    public int getMaxIndex(int caid, String key) {
        int max = 0;
        key = key.replace("\\s", "%%");
        Product p = new Product();
        String sql;
        if (caid == 0) {
            sql = "select count(proID) from Product where proName like '%" + key + "%' ";
        } else {
            sql = "select count(proID) from Product where caID=? and proName like '%" + key + "%' ";
        }

        try {

            conn = new DBContext().getConnection();
            PreparedStatement st = conn.prepareStatement(sql);
            if (caid != 0) {
                st.setInt(1, caid);
            }
            rs = st.executeQuery();
            while (rs.next()) {
                max = rs.getInt(1);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return max;
    }
    
    public void addCombo(String name, String price, int pid1,int pid2,int pid3,int pid4){
        String query = "insert into Combo values (?,?,'1')";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, name);
            ps.setString(2, price);
            ps.executeUpdate();
        } catch (Exception e) {
        }
        int id = getIDCombo(name);
        // add combo detail pid1
        query = "insert into [Combo Detail] values ("+id+",?)";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, pid1);
            ps.executeUpdate();
        } catch (Exception e) {
        }
        // add combo detail pid2
        query = "insert into [Combo Detail] values ("+id+",?)";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, pid2);
            ps.executeUpdate();
        } catch (Exception e) {
        }
        // add combo detail pid3
        query = "insert into [Combo Detail] values ("+id+",?)";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, pid3);
            ps.executeUpdate();
        } catch (Exception e) {
        }
        // add combo detail pid4
        query = "insert into [Combo Detail] values ("+id+",?)";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, pid4);
            ps.executeUpdate();
        } catch (Exception e) {
        }
        
    }
    
    public int getIDCombo(String name) {
       ComboList combo =new ComboList();
        String query = "select * from Combo where comboName =?";
        
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, name);
            rs = ps.executeQuery();
            while (rs.next()) {
                combo=(new ComboList(rs.getInt(1),
                        rs.getString(2),
                        rs.getFloat(3),
                        rs.getBoolean(4)      
                )
                );
            }
        } catch (Exception e) {
        }
        return combo.getComboID();
    }
    
    public ComboList getCombobyID(String id) {
       ComboList combo=null ;
        String query = "select * from Combo where comboID =?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                combo = (new ComboList(rs.getInt(1),
                        rs.getString(2),
                        rs.getFloat(3),
                        rs.getBoolean(4)      
                )
                );
            }
        } catch (Exception e) {
        }
        return combo;
    }
    
    public int setStatusCombo(String id, boolean status) throws Exception {
    String sql = "UPDATE Combo SET conboStatus = ? WHERE comboID = ?";
    try (Connection conn = new DBContext().getConnection();
         PreparedStatement ps = conn.prepareStatement(sql)) {
        ps.setBoolean(1, status);
        ps.setString(2, id);
        int rowsUpdated = ps.executeUpdate();
        System.out.println("Update status for ComboID=" + id + " → " + status);
        return rowsUpdated; 
    }
}


    
    
}
