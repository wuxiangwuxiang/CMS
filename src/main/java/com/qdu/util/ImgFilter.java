//package com.qdu.util;
//
//import java.awt.Graphics;
//import java.awt.Image;
//import java.awt.color.ColorSpace;
//import java.awt.image.BufferedImage;
//import java.awt.image.BufferedImageOp;
//import java.awt.image.ColorConvertOp;
//import java.awt.image.ConvolveOp;
//import java.awt.image.Kernel;
//
//class ImgeFilter {
//    private BufferedImage bufImage;
// 
//    public ImgeFilter(String imagePath) {
//        bufImage = imageToBufferedImage(new ImgeIcon(imagePath).getImage());
//    }
// 
//    public BufferedImage getOriginalImage() {
//        return bufImage;
//    }
// 
//    public BufferedImage getSharpImage() {
//        Kernel kernel = new Kernel(3, 3, new float[]{
//                -1, -1, -1,
//                -1, 9, -1,
//                -1, -1, -1
//        });
// 
//        BufferedImageOp op = new ConvolveOp(kernel);
//        return op.filter(bufImage, null);
//    }
// 
//    public BufferedImage getBlurImage() {
//        Kernel kernel = new Kernel(3, 3, new float[]{
//                1f / 9f, 1f / 9f, 1f / 9f,
//                1f / 9f, 1f / 9f, 1f / 9f,
//                1f / 9f, 1f / 9f, 1f / 9f
//        });
// 
//        BufferedImageOp op = new ConvolveOp(kernel);
//        return op.filter(bufImage, null);
//    }
// 
//    public BufferedImage getGrayImage() {
//        ColorSpace cs = ColorSpace.getInstance(ColorSpace.CS_GRAY);
//        ColorConvertOp op = new ColorConvertOp(cs, null);
//        return op.filter(bufImage, null);
//    }
// 
//    public BufferedImage getEmbossGrayImage() {
//        Kernel kernel = new Kernel(3, 3, new float[]{
//                -2, 0, 0,
//                0, 1, 0,
//                0, 0, 2
//        });
// 
//        BufferedImageOp op = new ConvolveOp(kernel);
//        return op.filter(bufImage, null);
//    }
// 
//    public BufferedImage getEmbossImage() {
//        Kernel kernel = new Kernel(3, 3, new float[]{
//                0,  -1, 0,
//                -1, 5, -1,
//                0, -1,  0
//        });
// 
//        BufferedImageOp op = new ConvolveOp(kernel);
//        return op.filter(bufImage, null);
//    }
// 
//    /**
//     * Convert the image to an buffered image.
//     * @param image An instance of the class Image
//     * @return An instance of the class BufferedImage that is converted from an image.
//     */
//    public static BufferedImage imageToBufferedImage(Image image) {
//        int width = image.getWidth(null);
//        int height = image.getHeight(null);
// 
//        BufferedImage buf = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
//        Graphics g = buf.createGraphics();
//        g.drawImage(image, 0, 0, width, height, null);
//        g.dispose();
// 
//        return buf;
//    }
//}