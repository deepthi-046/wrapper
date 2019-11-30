package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import beans.Loginbean;
import beans.TrackingBean;

public class TrackingDao {

	static Connection con = null;
	static PreparedStatement pst = null;
	static PreparedStatement ps = null;
	static ResultSet rs = null;
	static boolean flag = false;

	// -----------------------START-ACCESSCONNECTION-----------------------------------
	/**
	 *
	 * @author : TechTycoons
	 * @date : 12/11/2019
	 * @version: 1.0
	 * @purpose: Access Connection
	 * @param :
	 *            Nothing
	 * @return : Connection
	 */

	public static Connection getDbConnection() throws SQLException {

		try {
			DBDao.connect();
			con = DBDao.getDbCon();

		} catch (ClassNotFoundException ex) {
			ex.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return con;
	}
	// -----------------------END-ACCESSCONNECTION-----------------------------------

	// -----------------------Checking------------------------
	/**
	 *
	 * @author : TechTycoons
	 * @date : 12/11/2019
	 * @version: 1.0
	 * @purpose: statuschecking
	 * @param :nothing
	 * @see :nothing
	 * @throws:Exception in
	 *                       case of connection
	 * @return : String
	 */

	public static String check(TrackingBean trackingBean) throws SQLException {

		String status = "";

		try {

			con = getDbConnection();
			pst = con.prepareStatement("select * from tbl_tracking where o_id=?");
			pst.setInt(1, trackingBean.getOid());

			rs = pst.executeQuery();
			while (rs.next()) {
				status = rs.getString("t_status");

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return status;

	}
	// -----------------------END Checking------------------------
		/**
		 *
		 * @author : TechTycoons
		 * @date : 12/11/2019
		 * @version: 1.0
		 * @purpose: Id checking
		 * @param:  reference of enquiryBean
		 * @see :nothing
		 * @throws:Exception in case of connection
		 * @return : Integer
		 */
	public static Integer checkID(TrackingBean trackingBean) throws SQLException {

		int o_id = 0;

		try {

			con = getDbConnection();
			pst = con.prepareStatement("select * from tbl_tracking where o_id=?");
			pst.setInt(1, trackingBean.getOid());
			rs = pst.executeQuery();
			while (rs.next()) {
				o_id = rs.getInt("o_id");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return o_id;
	}
	//-----------------------------End checkid------------------------------
	
	//------------------------------Start update status---------------------
	
	/**
	 *
	 * @author : TechTycoons
	 * @date : 12/11/2019
	 * @version: 1.0
	 * @purpose: Id checking
	 * @param:  reference of enquiryBean
	 * @see :nothing
	 * @throws:Exception in case of connection
	 * @return : void
	 */
	 
		  public static void updateStatus(TrackingBean trackingBean ) throws SQLException{
		   
		 

		   
		     try{
		         
		     con=getDbConnection();
		     pst=con.prepareStatement("update tbl_tracking set t_status=? where o_id=?");
		     //TrackingBean trackingBean=new TrackingBean();
		pst.setString(1, trackingBean.getStatus());
		//System.out.println(trackingBean.getStatus());
		pst.setInt(2, trackingBean.getOid());

		     
		     pst.executeUpdate();
		     pst=con.prepareStatement("update tbl_order set o_status=? where o_id=?");
		     pst.setString(1, trackingBean.getStatus());

		pst.setInt(2, trackingBean.getOid());
		pst.executeUpdate();
		   
		 } catch(Exception e){
		     e.printStackTrace();
		 }
		 
		     
		}
		  //--------------EndupdateStatus-----------------------------------------------
		//-----------------------END-ACCESSCONNECTION-----------------------------------
}
