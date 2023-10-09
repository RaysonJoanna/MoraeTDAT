package MoraeTdat.Controller;

import MoraeTdat.Service.Define;
import MoraeTdat.Service.ShopService;
import MoraeTdat.data.Entity.Product;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.*;

@Controller
@RequestMapping(value="/MoraeTDAT/shop")
public class ShopController {

    final ShopService shopService;

    @Autowired
    public ShopController(ShopService shopService){
        this.shopService = shopService;
    }

    @RequestMapping(value="", method= RequestMethod.GET)
    public ModelAndView shopByCategory(ModelAndView mav,
                                       @RequestParam String category) {
        if(category.equals("tshirts")){
            mav.addObject("category",Define.TSHIRTS);
            mav.addObject("productList",shopService.shoplistByCategory(Define.TSHIRTS));
        } else if(category.equals("living")){
            mav.addObject("category",Define.LIVING);
            mav.addObject("productList",shopService.shoplistByCategory(Define.LIVING));
        } else if(category.equals("office")){
            mav.addObject("category",Define.OFFICE);
            mav.addObject("productList",shopService.shoplistByCategory(Define.OFFICE));
        } else if(category.equals("cute")){
            mav.addObject("category",Define.CUTE);
            mav.addObject("productList",shopService.shoplistByCategory(Define.CUTE));
        } else if(category.equals("preorder")){
            mav.addObject("category",Define.PREORDER);
            mav.addObject("productList",shopService.shoplistByCategory(Define.PREORDER));

        } else if(category.equals("best")){
            mav.addObject("category",Define.BEST);
            mav.addObject("productList",shopService.getBestList());
        } else if(category.equals("new")){
            mav.addObject("category",Define.NEW);
            mav.addObject("productList",shopService.getNewList());
        } else if(category.equals("sale")){
            mav.addObject("category",Define.SALE);
        }

        mav.setViewName("shop");
        return mav;
    }

    @ResponseBody
    @RequestMapping(value="/cart", method = RequestMethod.POST)
    public Map<String,Object> cart(ModelAndView mav,
                                   @RequestBody Map<String,Object> cart,
                                   @SessionAttribute(value = "loginID") String userid){
        Map<String,Object> addCart = new HashMap<>();
        Product cartinfo = new Product();
        int productnum = (int)cart.get("productnum");

        //등록한 적 있는 물건
        if(shopService.isExistsProduct(productnum)>0){
            String isdetail = (String)cart.get("isdetail");

            //상품 상세화면에서 장바구니에 담았을 때
            if(isdetail.equals("done")){
                String productoption = (String)cart.get("productoption");
                int amount = Integer.parseInt((String)cart.get("amount"));

                shopService.updateAmount(Integer.parseInt((String)cart.get("amount")),productoption,productnum);
            } else {
                shopService.updateAmount(1,"",productnum);
            }
        //신규로 등록된 물건
        } else {
            String isdetail = (String)cart.get("isdetail");

            cartinfo = shopService.cartinfoBynum(productnum);

            String productname = cartinfo.getProductname();
            int productprice = cartinfo.getProductprice();
            String mainphoto = cartinfo.getMainphoto();

            String productoption = "";
            int amount = 1;

            //상품 상세화면에서 장바구니에 담았을 때
            if(isdetail.equals("done")){
                productoption = (String)cart.get("productoption");
                amount = Integer.parseInt((String)cart.get("amount"));

                shopService.addCartByProductnum(productnum,productname,productprice,productoption,userid,amount,mainphoto);
            } else {
                shopService.addCartByProductnum(productnum,productname,productprice,productoption,userid,amount,mainphoto);
            }
        }
        addCart.put("addcart",true);

        return addCart;
    }

    @ResponseBody
    @RequestMapping(value="/heart", method = RequestMethod.POST)
    public Map<String,Object> heart(ModelAndView mav,
                                   @RequestBody Map<String,Object> heart,
                                   @SessionAttribute(value = "loginID") String userid){
        Map<String,Object> addheart = new HashMap<>();
        Product heartProduct = new Product();
        int productnum = (int)heart.get("productnum");

        if(shopService.checkHeart(productnum)==0){
            heartProduct = shopService.getProductBynum(productnum);

            String productname = heartProduct.getProductname();
            int productprice = heartProduct.getProductprice();
            String mainphoto = heartProduct.getMainphoto();

            shopService.addHeartByProductnum(productnum,productname,productprice,userid,mainphoto);
        }

        addheart.put("addheart",true);

        return addheart;
    }

    @RequestMapping(value="/shopdetail", method= RequestMethod.GET)
    public ModelAndView shopdetail(ModelAndView mav,
                                       @RequestParam String productnum) {
        Product product = new Product();
        product = shopService.getProductBynum(Integer.parseInt(productnum));

        mav.setViewName("shopdetail");
        mav.addObject("product",product);

        return mav;
    }

    @RequestMapping(value="/search", method = { RequestMethod.GET, RequestMethod.POST })
    public ModelAndView search(ModelAndView mav,
                             @RequestParam String keyword,
                             @RequestParam String category){

        List<Product> resultList = new ArrayList<>();

        if(category.equals(Define.BEST)){
            resultList = shopService.searchByKeywordB(keyword);
        } else if(category.equals(Define.NEW)){
            resultList = shopService.searchByKeywordN(keyword);
        }else {
            resultList = shopService.searchByKeyword(keyword,category);
        }


        mav.addObject("resultList",resultList);
        mav.addObject("search","done");

        mav.setViewName("shop");
        return mav;
    }

    @RequestMapping(value="/order", method = RequestMethod.GET )
    public ModelAndView order(ModelAndView mav,
                              @RequestParam String category,
                              @RequestParam String gijun){
        List<Product> orderList = new ArrayList<>();

        if(gijun.equals("popular")){
            orderList = shopService.orderHitList(category);
        } else if(gijun.equals("lowprice")){
            orderList = shopService.orderLowpriceList(category);
        }

        mav.addObject("orderList", orderList);
        mav.setViewName("shop");
        return mav;
    }

}
