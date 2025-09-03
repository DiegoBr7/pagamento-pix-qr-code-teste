package br.com.gerador.qrcode.controller;


import br.com.gerador.qrcode.service.PixService;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Map;

@RestController
@RequestMapping("/api/pix")
public class PixController {


    private final PixService service = new PixService();

    @PostMapping("/create")
    public Map<String,String > createPix(@RequestBody Map<String,String> body) throws Exception {
        String pixKey = body.get("pixkey");
        String amount = body.get("amount");
        String txid = body.getOrDefault("txid" , "GENRECTX");
        String merchantName = body.getOrDefault("merchantName", "MEUNOME");
        String merchantCity = body.getOrDefault("merchantCity", "SAO PAULO");

        String payload = service.buildBRCode(pixKey , amount , txid , merchantName, merchantCity);
        String base64 = service.generateQrBase64(payload , 400);

        System.out.println("Valor recebido: " + amount);

        return Map.of("payload" , payload , "qrcodeBase64" , base64);
    }

}
