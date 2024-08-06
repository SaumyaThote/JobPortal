package springmvc;

import java.io.BufferedOutputStream;
import java.io.FileOutputStream;
import java.sql.SQLException;
import java.util.List;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

public class MainDao {
	private JdbcTemplate jdbcTemplate;
	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}
	
	//add job
	public int addjob(MainModel rm) {
		String sql="insert into addjob(jobname,jobexp,jobpackage,jobskills,jobtype)values('"+rm.getJobname()+"','"+rm.getJobexp()+"','"+rm.getJobpackage()+"','"+rm.getJobskills()+"','"+rm.getJobtype()+"')";
		return jdbcTemplate.update(sql);
	}
	
	//to view job table
	public List<MainModel> getJobList()
	{
		String sql="select * from addjob";
		return jdbcTemplate.query(sql, new RowMapper<MainModel>() {
			@Override
			public MainModel mapRow(java.sql.ResultSet rs, int arg1) throws SQLException {
			    MainModel rm=new MainModel();
				rm.setJobid(rs.getInt(1));
				rm.setJobname(rs.getString(2));
				rm.setJobexp(rs.getString(3));
			
				return rm;
			}
		});
	}
	
	//for getting jobdetail by their Id in viewjobpage
	public List<MainModel>getJobById(int jobid){
		String sql="select *from addjob where jobid='"+jobid+"'";
		return jdbcTemplate.query(sql, new RowMapper<MainModel>() {
			@Override
			public MainModel mapRow(java.sql.ResultSet rs, int arg1) throws SQLException {	
				MainModel rm=new MainModel();
				rm.setJobid(rs.getInt(1));
				rm.setJobname(rs.getString(2));
				rm.setJobexp(rs.getString(3));
				rm.setJobpackage(rs.getString(4));
				rm.setJobskills(rs.getString(5));
				rm.setJobtype(rs.getString(6));
				return rm;
			}
		});
	}
	
	//for uploading resume
			public void upload(MainModel rm) {
				CommonsMultipartFile file = rm.getResume();
				String fileName = file.getOriginalFilename();
				String filepath="F:\\Java\\files";
				try{  
			        byte barr[]=file.getBytes();  
			        BufferedOutputStream bout=new BufferedOutputStream(  
			                 new FileOutputStream(filepath+"\\"+fileName));  
			        bout.write(barr);  
			        bout.flush();  
			        bout.close();           
			        }catch(Exception e){System.out.println(e);}  
			}
	
	//add applicant
		public int addApplicant(MainModel rm) {
			CommonsMultipartFile file = rm.getResume();
			String fileName = file.getOriginalFilename();
			System.out.print(rm.getJobname());
			String sql="insert into jobapplication(jobid,jobname,name,phone,resume)values('"+rm.getJobid()+"','"+rm.getJobname()+"','"+rm.getName()+"','"+rm.getPhone()+"','"+fileName+"')";
			return jdbcTemplate.update(sql);
		}
		
		//to view job applicants list in dashboard table
		public List<MainModel> getApplicantsList()
		{
			String sql="select * from jobapplication";
			return jdbcTemplate.query(sql, new RowMapper<MainModel>() {
				@Override
				public MainModel mapRow(java.sql.ResultSet rs, int arg1) throws SQLException {
				    MainModel rm=new MainModel();
				    rm.setId(rs.getInt(1));
					rm.setJobid(rs.getInt(2));
					rm.setJobname(rs.getString(3));
					rm.setName(rs.getString(4));
					rm.setPhone(rs.getString(5));
					rm.setFilename(rs.getString(6));
					return rm;
				}
			});
		}
		
		//deleting job applicant by Id
		public int deleteById(int id)
		{
			String sql="delete from jobapplication where id='"+id+"'";
			return jdbcTemplate.update(sql);
		}
		

}
