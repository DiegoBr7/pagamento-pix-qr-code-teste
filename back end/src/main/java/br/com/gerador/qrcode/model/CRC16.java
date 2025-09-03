package br.com.gerador.qrcode.model;

import java.nio.charset.StandardCharsets;

public class CRC16 {
    public static String crc16ccitt(String data){
        byte[] bytes = (data).getBytes(StandardCharsets.UTF_8);
        int crc = 0xFFFF;
        for (byte b : bytes) {
            crc ^= ((b & 0xFF) << 8);
            for (int i = 0; i < 8 ; i++) {
                if ((crc & 0x8000) != 0) crc = ((crc << 1) ^ 0x1021) & 0xFFFF;
                else crc = (crc << 1) & 0xFFFF;
            }
        }
        return String.format("%04X", crc);
    }
}
