/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package comparators;

import beans.RestaurantBean;
import java.util.Comparator;

/**
 *
 * @author MirkoPortatile
 */
public class RestaurantSearchValueComparator implements Comparator<RestaurantBean> {

    public int compare(RestaurantBean rest1, RestaurantBean rest2) {
        return rest1.getScore() - rest2.getScore();
    }
}
