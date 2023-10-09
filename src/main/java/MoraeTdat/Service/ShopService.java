package MoraeTdat.Service;

import MoraeTdat.data.Entity.Cart;
import MoraeTdat.data.Entity.Heart;
import MoraeTdat.data.Entity.Product;
import MoraeTdat.data.Repository.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

@Component
public class ShopService {
    private final ProductRepository productRepository;

    @Autowired
    public ShopService(ProductRepository productRepository) {
        this.productRepository = productRepository;
    }

    public List<Product> shoplistByCategory(String category){
        List<Product> productList = new ArrayList<>();
        productList = productRepository.shoplistByCategory(category);

        return productList;
    }

    public Product cartinfoBynum(int productnum){
        Product cartinfo = new Product();

        cartinfo = productRepository.getProductBynum(productnum);
        return cartinfo;
    }

    public Product getProductBynum(int productnum){
        Product cartinfo = new Product();

        cartinfo = productRepository.getProductBynum(productnum);
        return cartinfo;
    }

    public void addCartByProductnum(int productnum, String productname, int productprice, String productoption, String userid, int amount, String mainphoto){
        productRepository.addCartByProductnum(productnum, productname, productprice, productoption, userid, amount, mainphoto);
    }

    public void addHeartByProductnum(int productnum, String productname, int productprice, String userid, String mainphoto){
        productRepository.addHeartByProductnum(productnum, productname, productprice, userid, mainphoto);
    }

    public List<Product> searchByKeyword(String keyword, String category) {
        return productRepository.searchByKeyword(keyword,category);
    }

    public List<Product> searchByKeywordB(String keyword) {
        return productRepository.searchByKeywordB(keyword);
    }

    public List<Product> searchByKeywordN(String keyword) {
        return productRepository.searchByKeywordN(keyword);
    }

    public int isExistsProduct(int productnum){
        return productRepository.isExistsProduct(productnum);
    }

    public void updateAmount(int amount, String productoption, int productnum){
        productRepository.updateAmount(amount, productoption, productnum);
    }

    public int checkHeart(int productnum){
        return productRepository.checkHeart(productnum);
    }

    public List<Heart> getHeartList(String userid){return productRepository.getHeartList(userid);}

    public List<Product> getBestList(){return productRepository.getBestList();}

    public List<Product> getNewList(){return productRepository.getNewList();}

    public List<Product> orderHitList(String category){return productRepository.orderHitList(category);}

    public List<Product> orderLowpriceList(String category){return productRepository.orderLowpriceList(category);}

}
