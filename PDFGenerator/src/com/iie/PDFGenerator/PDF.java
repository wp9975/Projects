package com.iie.PDFGenerator;

import java.io.FileNotFoundException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.itextpdf.layout.element.Paragraph;
import com.itextpdf.layout.element.Table;
import com.itextpdf.layout.property.TextAlignment;
import com.itextpdf.layout.property.VerticalAlignment;
import com.itextpdf.kernel.geom.PageSize;
import com.itextpdf.kernel.pdf.PdfDocument;
import com.itextpdf.kernel.pdf.PdfWriter;
import com.itextpdf.layout.Document;
import com.itextpdf.layout.border.Border;
import com.itextpdf.layout.element.Cell;
import com.itextpdf.kernel.color.Color;
import com.itextpdf.kernel.color.DeviceRgb;

public class PDF {

    private static Integer bill;
    private static Integer paid;
    private static Integer left;
    private static Integer roomPrice;
    private static Integer daysInHotel;
    private static Integer idReservation;
    private static String name;
    private static String address;
    private static String nip;
    private static String payMethod;
    private static String roomNumber;
    private static String invoiceNumber;
    private static String addons;

    public static Integer getBill() {
        return bill;
    }

    public static void setBill(Integer bill) {
        PDF.bill = bill;
    }

    public static Integer getPaid() {
        return paid;
    }

    public static void setPaid(Integer paid) {
        PDF.paid = paid;
    }

    public static Integer getLeft() {
        return left;
    }

    public static void setLeft(Integer left) {
        PDF.left = left;
    }

    public static Integer getRoomPrice() {
        return roomPrice;
    }

    public static void setRoomPrice(Integer roomPrice) {
        PDF.roomPrice = roomPrice;
    }

    public static Integer getDaysInHotel() {
        return daysInHotel;
    }

    public static void setDaysInHotel(Integer daysInHotel) {
        PDF.daysInHotel = daysInHotel;
    }

    public static Integer getIdReservation() {
        return idReservation;
    }

    public static void setIdReservation(Integer idReservation) {
        PDF.idReservation = idReservation;
    }

    public static String getName() {
        return name;
    }

    public static void setName(String name) {
        PDF.name = name;
    }

    public static String getAddress() {
        return address;
    }

    public static void setAddress(String address) {
        PDF.address = address;
    }

    public static String getNip() {
        return nip;
    }

    public static void setNip(String nip) {
        PDF.nip = nip;
    }

    public static String getPayMethod() {
        return payMethod;
    }

    public static void setPayMethod(String payMethod) {
        PDF.payMethod = payMethod;
    }

    public static String getRoomNumber() {
        return roomNumber;
    }

    public static void setRoomNumber(String roomNumber) {
        PDF.roomNumber = roomNumber;
    }

    public static String getInvoiceNumber() {
        return invoiceNumber;
    }

    public static void setInvoiceNumber(String invoiceNumber) {
        PDF.invoiceNumber = invoiceNumber;
    }

    public static String getAddons() {
        return addons;
    }

    public static void setAddons(String addons) {
        PDF.addons = addons;
    }

    public static String getDest() {
        return dest;
    }

    public static void setDest(String dest) {
        PDF.dest = dest;
    }

    public static String dest;

    static DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
    static Date date = new Date();

    public static void savePdF(String destination, Integer idReservation, String name, String address, String nip, String invoiceNumber, String payMethod, Integer bill
            , String roomNumber, Integer roomPrice, String addons, Integer daysInHotel, Integer paid, Integer leftToPay) throws FileNotFoundException {

        setIdReservation(idReservation);
        setName(name);
        setAddress(address);
        setNip(nip);
        setBill(bill);
        setPayMethod(payMethod);
        setRoomNumber(roomNumber);
        setInvoiceNumber(invoiceNumber);
        setRoomPrice(roomPrice);
        setAddons(addons);
        setDaysInHotel(daysInHotel);
        setPaid(paid);
        setLeft(leftToPay);
        setDest(destination);

        PdfWriter writer = new PdfWriter(dest);

        PdfDocument pdfDoc = new PdfDocument(writer);
        Document document = new Document(pdfDoc);
        pdfDoc.setDefaultPageSize(PageSize.A4);


        // BaseFont unicode = BaseFont.createFont(
        //         fontFile.getAbsolutePath(), BaseFont.IDENTITY_H, BaseFont.EMBEDDED);
        //  PdfFont font = PdfFontFactory.createFont(FontConstants.HELVETICA_BOLD, UTF_8);


        float columnWidth[] = {200, 360};
        Table table = new Table(columnWidth);

        table.setBackgroundColor(new DeviceRgb(63, 169, 219))
                .setFontColor(Color.WHITE);
        table.addCell(new Cell().add("FAKTURA")
                .setTextAlignment(TextAlignment.CENTER)
                .setVerticalAlignment(VerticalAlignment.MIDDLE)
                .setMarginTop(30f)
                .setMarginBottom(30f)
                .setFontSize(30f)
                .setBorder(Border.NO_BORDER));


        table.addCell(new Cell().add("Hill Hotel\nJan Kowalski\nZakopane 34-500\nKarłowicza 15\nNIP: 576-604-95-99\n" +
                        "Konto: PKO BP 11 1140 2004 0000 3002 0135 5387")
                .setTextAlignment(TextAlignment.RIGHT)
                .setFontSize(10)
                .setMarginTop(30f)
                .setMarginBottom(30f)
                .setBorder(Border.NO_BORDER)
                .setMarginRight(10f)

        );


        float colWidth[] = {100, 280, 100, 80};
        Table customerInfo = new Table(colWidth);

        customerInfo.addCell(new Cell(0, 4)
                .add("Nabywca/Platnik:")
                .setBold()
                .setBorder(Border.NO_BORDER)

        );

        customerInfo.addCell(new Cell().add("Imie i nazwisko: "));
        customerInfo.addCell(new Cell().add(name));
        customerInfo.addCell(new Cell().add("Nr faktury: "));
        customerInfo.addCell(new Cell().add(invoiceNumber));

        customerInfo.addCell(new Cell().add("Adres: "));
        customerInfo.addCell(new Cell().add(address));
        customerInfo.addCell(new Cell().add("Data: "));
        customerInfo.addCell(new Cell().add(dateFormat.format(date)));

        customerInfo.addCell(new Cell().add("Nr NIP: "));
        customerInfo.addCell(new Cell().add(nip));
        customerInfo.addCell(new Cell().add("Miejsce: "));
        customerInfo.addCell(new Cell().add("Hill Hotel"));

        customerInfo.addCell(new Cell().add("Nr rezerwacji: "));
        customerInfo.addCell(new Cell().add(String.valueOf(idReservation)));
        customerInfo.addCell(new Cell().add("Forma platności: "));
        customerInfo.addCell(new Cell().add(payMethod));


        float infoColWidth[] = {30, 82, 112, 112, 112, 112};
        Table infoTable = new Table(infoColWidth);

        infoTable.addCell(new Cell()
                .add("Lp")
                .setBackgroundColor(new DeviceRgb(63, 169, 219))
                .setFontColor(Color.WHITE));
        infoTable.addCell(new Cell()
                .add("Nr pokoju")
                .setBackgroundColor(new DeviceRgb(63, 169, 219))
                .setFontColor(Color.WHITE));
        infoTable.addCell(new Cell()
                .add("Cena")
                .setBackgroundColor(new DeviceRgb(63, 169, 219))
                .setFontColor(Color.WHITE));
        infoTable.addCell(new Cell()
                .add("Suma dni")
                .setBackgroundColor(new DeviceRgb(63, 169, 219))
                .setFontColor(Color.WHITE));
        infoTable.addCell(new Cell()
                .add("Dodatki")
                .setBackgroundColor(new DeviceRgb(63, 169, 219))
                .setFontColor(Color.WHITE));
        infoTable.addCell(new Cell().add("Suma")
                .setBackgroundColor(new DeviceRgb(63, 169, 219))
                .setFontColor(Color.WHITE));

        infoTable.addCell(new Cell().add(" 1 ").setTextAlignment(TextAlignment.RIGHT));
        infoTable.addCell(new Cell().add(roomNumber).setTextAlignment(TextAlignment.RIGHT));
        infoTable.addCell(new Cell().add(String.valueOf(roomPrice)).setTextAlignment(TextAlignment.RIGHT));
        infoTable.addCell(new Cell().add(String.valueOf(daysInHotel)).setTextAlignment(TextAlignment.RIGHT));
        infoTable.addCell(new Cell().add(addons).setTextAlignment(TextAlignment.RIGHT));
        infoTable.addCell(new Cell().add(String.valueOf(bill)).setTextAlignment(TextAlignment.RIGHT));


        infoTable.addCell(new Cell().add(" ")
                .setBorder(Border.NO_BORDER));
        infoTable.addCell(new Cell().add(" ")
                .setBorder(Border.NO_BORDER));
        infoTable.addCell(new Cell().add(" ")
                .setBorder(Border.NO_BORDER));
        infoTable.addCell(new Cell().add(" ")
                .setBorder(Border.NO_BORDER));
        infoTable.addCell(new Cell().add("Podsumowanie:")
                .setBackgroundColor(new DeviceRgb(63, 169, 219))
                .setFontColor(Color.WHITE));
        infoTable.addCell(new Cell().add(String.valueOf(bill))
                .setBackgroundColor(new DeviceRgb(63, 169, 219))
                .setFontColor(Color.WHITE)
                .setTextAlignment(TextAlignment.RIGHT));


        document.add(table);
        document.add(new Paragraph("\n"));
        document.add(customerInfo);
        document.add(new Paragraph("\n"));
        document.add(infoTable);
        document.add(new Paragraph("\n\nDO ZAPLATY: " + bill + " zl"));

        document.add(new Paragraph("\nZaplacono: " + paid + " zl").setBold());

        document.add(new Paragraph("Do zaplaty pozostało: " + left + " zl"));


        document.add(new Paragraph("\nUwagi:").setBold());
        document.add(new Paragraph("Nie dotrzymanie terminu platności spowoduje naliczenie odsetek ustawowych (Art.455XC)\n\n\n").setFontSize(8));


        float tab[] = {420, 160};
        Table signature = new Table(tab);
        signature.addCell(new Cell()
                .add("Osoba odbierajaca fakture:")
                .setBorder(Border.NO_BORDER));
        signature.addCell(new Cell()
                .add("Osoba wystawiajaca fakture:")
                .setBorder(Border.NO_BORDER));

        signature.addCell(new Cell()
                .add("........................................")
                .setBorder(Border.NO_BORDER));
        signature.addCell(new Cell()
                .add("..........................................")
                .setBorder(Border.NO_BORDER));

        document.add(signature);


        document.close();
        System.out.println("PDF Created");


    }


}
