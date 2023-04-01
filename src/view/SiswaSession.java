//tasya's coding
package view;

public class SiswaSession {
    private static String nisn;
    private static String nama;
    
    public static String get_nisn(){
        return nisn;
    }
    
    public static void set_nisn(String nisn){
        SiswaSession.nisn = nisn;
    }
    
    public static String get_nama(){
        return nama;
    }
    
    public static void set_nama(String nama){
        SiswaSession.nama = nama;
    }
}
