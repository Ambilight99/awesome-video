package com.awesome.web.util;

import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;
import java.util.stream.Collectors;

/**
 * @author adam
 * @ClassName CompareUtils
 * @Description 比较工具
 * @create 2017/3/13 19:03
 */
public class CompareUtils<E> {

    /**
     * 比较两个集合不同
     * @param source 源集合
     * @param target 目标集合
     * @return
     */
    public Map<String,Set<E>> diffSet(Set<E> source, Set<E> target){
        Map<String,Set<E>> map = new HashMap<>();
        Set<E> add = source.stream().filter( s -> !target.contains(s)).collect(Collectors.toSet());
        Set<E> delete = target.stream().filter( s -> !source.contains(s)).collect(Collectors.toSet());
        map.put("add",add);
        map.put("delete",delete);
        return map;
    }

    public static void main(String[] args) {
        CompareUtils<Integer> c = new CompareUtils<>();
        Set<Integer> source = new HashSet<Integer>(){{
            add(1);
            add(2);
            add(3);
        }};
        Set<Integer> target = new HashSet<Integer>(){{
            add(2);
            add(3);
            add(4);
        }};
        Map m =c.diffSet(source,target);
        System.out.println(m.get("add"));
        System.out.println(m.get("delete"));
    }
}
