package com.cinema.mypage;

import java.sql.Date;

import lombok.Data;
@Data
public class StoreListDTO {
    private int id;
    private String customer_id;
    private String random_id;
    private String item_name;
    private int totalprice;
    private Date created;
    private Date updated;
    private String itemName;
    private String composition;
    
    // " "로 구분하여 상품명과 구성으로 나누기
    public void parseItemName(String itemName) {
        // 상품명과 구성 부분을 분리
        String[] parts = itemName.split(","); // 각 항목을 나누기 위해 콤마로 분리
        StringBuilder itemNameBuilder = new StringBuilder();
        StringBuilder compositionBuilder = new StringBuilder();
        	
        for (int i = 0; i < parts.length; i++) {
            String part = parts[i].trim();
            int spaceIndex = part.indexOf("  ");
            if (spaceIndex != -1) {
                String itemPart = part.substring(0, spaceIndex); // 상품명 부분
                String compositionPart = part.substring(spaceIndex + 1); // 구성 부분
            	System.out.println(spaceIndex);
                // 상품명에 추가 (각 항목마다 줄바꿈)
                if (i > 0) {
                    itemNameBuilder.append("<br>"); // 줄바꿈 추가
                }
                itemNameBuilder.append(itemPart);

                // 구성에 추가 (각 항목마다 줄바꿈)
                if (i > 0) {
                    compositionBuilder.append("<br>"); // 줄바꿈 추가
                }
                compositionBuilder.append(compositionPart);
            } else {
                // 공백이 없는 경우
                if (i > 0) {
                    itemNameBuilder.append("\n");
                    compositionBuilder.append("\n");
                }
                itemNameBuilder.append(part);
            }
        }

        this.itemName = itemNameBuilder.toString(); // 최종 상품명
        this.composition = compositionBuilder.toString(); // 최종 구성
    }

}