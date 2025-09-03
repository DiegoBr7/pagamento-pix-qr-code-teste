package br.com.gerador.qrcode.service;

import br.com.gerador.qrcode.model.CRC16;
import com.google.zxing.BarcodeFormat;
import com.google.zxing.EncodeHintType;
import com.google.zxing.MultiFormatWriter;
import com.google.zxing.client.j2se.MatrixToImageWriter;
import com.google.zxing.common.BitMatrix;

import java.beans.Encoder;
import java.io.ByteArrayOutputStream;
import java.util.Base64;
import java.util.HashMap;
import java.util.Map;

public class PixService {

    private String tlv(String id , String value){
        return id + String.format("%02d" , value.length()) + value;
    }

    public String buildBRCode(String pixKey, String amount, String txid, String merchantName, String merchantCity) {

        // 00 = payload format indicator
        StringBuilder sb = new StringBuilder();
        sb.append(tlv("00","01"));

        String gui = tlv("00" , "BR.GOV.BCB.PIX");
        String keyTag = tlv("01" , pixKey);
        String mailValue = gui + keyTag;
        sb.append(tlv("26" , mailValue));

        sb.append(tlv("52", "0000")); // MCC(0000 when not provided)
        sb.append(tlv("53", "986")); // BRL
        sb.append(tlv("54", amount)); // amount (format: "10.00")
        sb.append(tlv("58", "BR"));
        sb.append(tlv("59", merchantName.length() > 25 ? merchantName.substring(0,25) : merchantName )); // MCC(0000 when not provided)
        sb.append(tlv("60", merchantCity.length() > 25 ? merchantCity.substring(0,25) : merchantCity )); // MCC(0000 when not provided)

        // additional Data Field Template (62) -> 05 = txid
        String additional = tlv("05" , txid);
        sb.append(tlv("62" , additional));

        // Calculate CRC: append "6304" then compute CRC16
        String payloadForCrc = sb.toString() + "6304";
        String crc = CRC16.crc16ccitt(payloadForCrc);
        sb.append("63").append("04").append(crc);

        return sb.toString();
    }

    public String generateQrBase64(String text , int size) throws Exception{
        Map<EncodeHintType , Object> hints = new HashMap<>();
        hints.put(EncodeHintType.CHARACTER_SET,"UTF-8");
        BitMatrix matrix = new MultiFormatWriter().encode(text, BarcodeFormat.QR_CODE, size, size, hints);
        ByteArrayOutputStream baos = new ByteArrayOutputStream();
        MatrixToImageWriter.writeToStream(matrix , "PNG" , baos);
        return Base64.getEncoder().encodeToString(baos.toByteArray());
    }

}
