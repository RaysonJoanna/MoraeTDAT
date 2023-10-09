package MoraeTdat.Service;

import MoraeTdat.data.Entity.Cart;
import MoraeTdat.data.Repository.CartRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

@Component
public class CartService {

    private final CartRepository cartRepository;

    @Autowired
    public CartService(CartRepository cartRepository) {
        this.cartRepository = cartRepository;
    }

    public List<Cart> getCartList(String userid){
        List<Cart> cartlist = new ArrayList<>();

        cartlist = cartRepository.getCartList(userid);
        return cartlist;
    }

    public void deleteAll(String userid){
        cartRepository.deleteAll(userid);
    }

    public void deletePart(int number, String userid){
        cartRepository.deletePart(number, userid);
    }

}
