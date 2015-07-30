package report;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperPrintManager;

public class Reporter {

	public void printReport(int buyerNum, String dir) throws IOException, SQLException {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("Buyer", buyerNum);
		try {
			InputStream i = new FileInputStream(dir + "/Invoice.jasper");
			Connection connection = DriverManager.getConnection("jdbc:postgresql://localhost:5432/auction", "postgres", "P0stgr3s");
			JasperPrint jasperPrint = JasperFillManager.fillReport(i, params, connection);
			JasperPrintManager.printReport(jasperPrint, false);
			JasperPrintManager.printReport(jasperPrint, false);
		} catch (JRException e) {
			e.printStackTrace();
		}
	}
}
