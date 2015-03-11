package roti;

import java.util.Random;

public class __GenerateRandomWords {

	public __GenerateRandomWords(){
		
	}

	public String getRandomWords(){

		//generate a random password
		Random rnd = new Random();
		int random_pass = 10000000 + rnd.nextInt(90000000);

		Random rnd1 = new Random();
		char c1 = (char)(rnd1.nextInt(26) + 'a');

		Random rnd2 = new Random();
		char c2 = (char)(rnd2.nextInt(26) + 'A');

		Random rnd3 = new Random();
		char c3 = (char)(rnd3.nextInt(26) + 'a');
		
		Random rnd4 = new Random();
		char c4 = (char)(rnd4.nextInt(26) + 'A');
		Random rnd5 = new Random();
		char c5 = (char)(rnd5.nextInt(26) + 'A');
		Random rnd6 = new Random();
		char c6 = (char)(rnd6.nextInt(26) + 'a');
		Random rnd7 = new Random();
		char c7 = (char)(rnd7.nextInt(26) + 'a');
		Random rnd8 = new Random();
		char c8 = (char)(rnd8.nextInt(26) + 'A');

		Random rnd9 = new Random();
		int random_pass9 = 1000000 + rnd9.nextInt(9000000);

		return random_pass + "adG" + c1 +"aAd"+ c3 + "T" + random_pass9 + c2+ "ocX" + c4 + "L" + c5 + "zs" + c6 + "h23f" + c7 + "tIsk" +c8;

	}

	public String getNRandomWords(int j){
		
		String random_phrase = "";
		
		for(int i = 0; i < j ; i++){
			
			if(i == 10)
				random_phrase += getRandomWords() + "1II1";
			else if(i == 11)
				random_phrase += getRandomWords() + "1II1";
			else
				random_phrase += getRandomWords();
		}
		
		return random_phrase + "fqq";
	}
}
