
import dao.DAO;
import entity.Cart;
import java.util.ArrayList;
import java.util.List;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
/**
 *
 * @author ADMIN
 */
public class CartTest {

    public static void main(String[] args) {

        DAO dao = new DAO();
        dao.editProduct("Maine Coonnnnnnn", "https://www.toutagri.fr/wp-content/uploads/2018/12/Maine-Coon-4-230x230.jpg",
                "7000.0", "Maine Coonnnnnnnnnnnnnn", "The Maine Coon is an American breed of cat. They are known for their long, thick fur.",
                "2", "5");
    }
}
