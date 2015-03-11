package roti;

import java.security.spec.KeySpec;

import javax.crypto.Cipher;
import javax.crypto.SecretKey;
import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.PBEKeySpec;
import javax.crypto.spec.SecretKeySpec;

/**
 * 
 *  @since    2/17/2014
 *  @version  1.0
 * 
 */

public class EncryptionBytes {
	
	public EncryptionBytes(){
		
		
	}
	// Algorithm used
    private final static String SuanFa = "AES";
	//private final static String SuanFa = "AES-256";

    /**
     * Encrypt data
     * 
     * @param secretKey -   a secret key used for encryption
     * 
     * @param data      -   data to encrypt
     * 
     * @return  Encrypted data
     * 
     * @throws Exception
     */

    public static String toBaoMi(String secretKey, String data) throws Exception {

        

    	SecretKeyFactory factory = SecretKeyFactory.getInstance("PBKDF2WithHmacSHA1");

    	KeySpec spec = new PBEKeySpec(secretKey.toCharArray(), secretKey.getBytes(), 128, 256);

    	SecretKey tmp = factory.generateSecret(spec);

    	SecretKey key = new SecretKeySpec(tmp.getEncoded(), SuanFa);

    	

        Cipher cipher = Cipher.getInstance(SuanFa);

        cipher.init(Cipher.ENCRYPT_MODE, key);

         

        return toShiLiuJinZhi(cipher.doFinal(data.getBytes()));

    }

    /**
     * Decrypt data
     * 
     * @param secretKey -   a secret key used for decryption
     * 
     * @param data      -   data to decrypt
     * 
     * @return  Decrypted data
     * 
     * @throws Exception
     */

    public static String toJieKai(String secretKey, String data) throws Exception {

    	SecretKeyFactory factory = SecretKeyFactory.getInstance("PBKDF2WithHmacSHA1");

    	KeySpec spec = new PBEKeySpec(secretKey.toCharArray(), secretKey.getBytes(), 128, 256);

    	SecretKey tmp = factory.generateSecret(spec);

    	SecretKey key = new SecretKeySpec(tmp.getEncoded(), SuanFa);

        Cipher cipher = Cipher.getInstance(SuanFa);
        
        cipher.init(Cipher.DECRYPT_MODE, key);

         if(data == null)
        	 data = "";
         
        return new String(cipher.doFinal(toErJinZhi(data)));

    }

     

    // Helper methods
    private static byte[] toErJinZhi(String hexString) {

        int len = hexString.length()/2;

         

        byte[] result = new byte[len];

        for (int i = 0; i < len; i++)

            result[i] = Integer.valueOf(hexString.substring(2*i, 2*i+2), 16).byteValue();

        return result;

    }

    public static String toShiLiuJinZhi(byte[] stringBytes) {

        StringBuffer result = new StringBuffer(2*stringBytes.length);

        
        for (int i = 0; i < stringBytes.length; i++) {

            result.append(ShiLiuJinZhi.charAt((stringBytes[i]>>4)&0x0f)).append(ShiLiuJinZhi.charAt(stringBytes[i]&0x0f));

        }
        return result.toString();

    }


    private final static String ShiLiuJinZhi = "0123456789ABCDEF";
    
}
