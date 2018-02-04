package test;
import com.mongodb.*;
import java.net.UnknownHostException;
public class dconnect {
	final String HOST="localhost";
	final int PORT=27017;
	final String DBNAME="test1";
	public static dconnect instance;
	public Mongo connection;
	public DB database;
	
	private dconnect() throws UnknownHostException
	{
		this.connection=new Mongo(this.HOST,this.PORT);
		this.database=this.connection.getDB(this.DBNAME);

	}
	public static dconnect createInstance() throws UnknownHostException
	{
		if(dconnect.instance==null)
		{
			dconnect.instance=new dconnect();
		}
		return dconnect.instance;
		
	}

}