/**
 * 
 */
package roti;

import java.io.File;
import java.io.InputStream;

import com.amazonaws.AmazonClientException;
import com.amazonaws.AmazonServiceException;
import com.amazonaws.auth.AWSCredentialsProvider;
import com.amazonaws.auth.AWSCredentials;
import com.amazonaws.auth.BasicAWSCredentials;
import com.amazonaws.auth.profile.ProfileCredentialsProvider;
//import com.amazonaws.auth.InstanceProfileCredentialsProvider;
import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.AmazonS3Client;
import com.amazonaws.services.s3.model.CannedAccessControlList;
import com.amazonaws.services.s3.model.ObjectMetadata;
import com.amazonaws.services.s3.model.PutObjectRequest;
import com.amazonaws.services.s3.model.PutObjectResult;

/**
 * @author jusanng
 *
 */
public class ___S3 {

	private AWSCredentialsProvider provider = null;
	private AmazonS3 s3client = null;

	private final String AWS_ACCESS_KEY = "AKIAIRNTYRNDBOQ3BS7A";
	private final String AWS_SECRET_KEY = "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";

	public ___S3() {
		// get iam role associated with the instance
//		provider = new InstanceProfileCredentialsProvider();
		// instantiate s3client with permission
		s3client = new AmazonS3Client(
			    new BasicAWSCredentials(AWS_ACCESS_KEY, AWS_SECRET_KEY));
//		s3client = new AmazonS3Client(provider);
	}

	public void upload_single_stream(String bucket, String key, InputStream in, int fileSize) {
		
		// set in the metadata for putObjectRequest method
		ObjectMetadata metadata = new ObjectMetadata();
	    metadata.setContentLength(fileSize);
	    metadata.setContentType("image/jpg");
	    
	    try {
	    	
	    	if (in == null) {
	    		System.out.println("in is null");
	    	}
	    	else {
	    		System.out.println("in not null");
	    	}   	
	    	PutObjectResult a = s3client.putObject(new PutObjectRequest(bucket, key, in, metadata).withCannedAcl(CannedAccessControlList.PublicRead));
	    
	    	System.out.println(a.getETag());
	    	
	    } catch (AmazonServiceException ase) {
			print_amazon_exception(ase);
		} catch (AmazonClientException ace) {
            print_amazon_exception(ace);
		} 
//	    catch (NullPointerException e) {
//			System.out.println("Null Me");
//		}
	}
	
	/**
	 * 
	 * @param bucket
	 * @param key
	 * @param in
	 * @param fileSize LONG
	 */
	public void upload_single_stream(String bucket, String key, InputStream in, long fileSize) {
		
		// set in the metadata for putObjectRequest method
		ObjectMetadata metadata = new ObjectMetadata();
	    metadata.setContentLength(fileSize);
	    metadata.setContentType("image/jpg");
	    
	    try {
	    	
	    	if (in == null) {
	    		System.out.println("in is null");
	    	}
	    	else {
	    		System.out.println("in not null");
	    	}   	
	    	PutObjectResult a = s3client.putObject(new PutObjectRequest(bucket, key, in, metadata).withCannedAcl(CannedAccessControlList.PublicRead));
	    
	    	System.out.println(a.getETag());
	    
	    } catch (AmazonServiceException ase) {
			print_amazon_exception(ase);
		} catch (AmazonClientException ace) {
            print_amazon_exception(ace);
		} 
//	    catch (NullPointerException e) {
//			System.out.println("Null Me");
//		}
	}
	
	public String upload_single_file(String bucket, String uploadFileName, File uploadFile) {
		
		try {		
//			File file = new File(uploadFileName);
			s3client.putObject(new PutObjectRequest(
					bucket, uploadFileName, uploadFile));
		
			return "success";
			
		} catch (AmazonServiceException ase) {
			print_amazon_exception(ase);
            return "fail";
            
		} catch (AmazonClientException ace) {
            print_amazon_exception(ace);
            return "fail";
		} 
	}
	
	private void print_amazon_exception (Exception e) {
		if (e.getClass().getName() == "AmazonServiceException") {
			
			AmazonServiceException ase = (AmazonServiceException) e;
			
			System.out.println("Caught an AmazonServiceException, which " +
            		"means your request made it " +
                    "to Amazon S3, but was rejected with an error response" +
                    " for some reason.");
            System.out.println("Error Message:    " + ase.getMessage());
            System.out.println("HTTP Status Code: " + ase.getStatusCode());
            System.out.println("AWS Error Code:   " + ase.getErrorCode());
            System.out.println("Error Type:       " + ase.getErrorType());
            System.out.println("Request ID:       " + ase.getRequestId());
		
		}
		else if ((e.getClass().getName() == "AmazonClientException ace")) {
			
			AmazonClientException ace = (AmazonClientException) e;
			
			System.out.println("Caught an AmazonClientException, which " +
            		"means the client encountered " +
                    "an internal error while trying to " +
                    "communicate with S3, " +
                    "such as not being able to access the network.");
            System.out.println("Error Message: " + ace.getMessage());
		}
	}
}