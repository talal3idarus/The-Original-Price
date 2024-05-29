import express from 'express';
import mongoose from 'mongoose';
import cors from 'cors';
import ProModel from './moduls/ProModel.js';
import FdbModel from './moduls/FeedModel.js';
import ReqModel from './moduls/ReqModel.js';
import AdmModel from './moduls/AdminModel.js';

var app=express();
app.use(cors());
app.use(express.json());

var conn="mongodb+srv://16J19184:123@cluster0.jzvbo4w.mongodb.net/OriginalDB?retryWrites=true&w=majority";
mongoose.connect(conn);

app.get("/products/:brand",async(req, res)=>{
    let brand = req.params.brand
    ProModel.find({BRAND:brand}).then((response)=>{
      res.status(200).json(response)
    }).catch((err)=>{
      console.log(err)
      res.status(404).json({message:"not found"})
    })
   
});


app.get("/products/",async(req, res)=>{
    const pros=await ProModel.find({})
        .then(async(pros)=>res.send({pros}))
        .catch((err)=>res.send(err));
});




app.get("/admins",async(req, res)=>{
    const adm=await AdmModel.find({})
        .then(async(adm)=>res.send({adm}))
        .catch((err)=>res.send(err));
});




app.post("/addproduct",async(req, res)=>{
    const pid=req.body.pPID;
    const pnm=req.body.pPNAME;
    const pinfo=req.body.pINFO;
    const pprice=req.body.pPRICE;
    const ptax=req.body.pTAX;
    const brand=req.body.pBRAND;
    const pimage=req.body.pIMAGE;

    const new_pro=await new ProModel({
        PID:pid,
        PNAME:pnm,
        PINFO:pinfo,
        PPRICE:pprice,
        PPTAX:ptax,
        BRAND:brand,
        IMAGE:pimage,
    });
    new_pro.save();
    res.send("Product Added..")
});


app.get("/getProd/:id", async (req, res) => {
    try {
      const id = req.params.id;
      const result = await ProModel.findById(id);
      const count = await ProModel.countDocuments();
      res.send({ result, count });
    } catch (err) {
      console.error(err);
      res.send({ error: "Internal server error" });
    }
  });




app.put("/update",async(req, res)=>{
    const _id=req.body._id;
    const pid=req.body.PID;
    const pnm=req.body.PNAME;
    const pinfo=req.body.PINFO;
    const pprice=req.body.PPRICE;
    const brand=req.body.BRAND;
    const pimage=req.body.IMAGE;

    const upPro=await ProModel.findById(_id);
    if(upPro){
        console.log("found product")
        upPro.PNAME=pnm;
        upPro.PINFO=pinfo;
        upPro.PPRICE=pprice;
        upPro.PPTAX=PPTAX
        upPro.BRAND=brand;
        upPro.IMAGE=pimage;
        upPro.save();
        res.send("Product Updated..");
    }
    else{
        res.send("Product Not Found");
        console.log("not found")
    }
});




app.delete("/delproduct/:ID",async(req, res)=>{
    const pid=req.params.ID;
    const delPro=await ProModel.findOneAndDelete({PID:pid});
    if(delPro)
        res.send("Product Deleted...");
    else
    res.send("Product Not Found...");
});




app.post("/addFeedback",async(req, res)=>{
    const fid=req.body.cFNM;
    const fnm=req.body.cFPH;
    const fd=req.body.cFDB;

    const new_fd=await new FdbModel({
        FID:fid,
        FNAME:fnm,
        FEEDBACK:fd,
    });
    new_fd.save();
    res.send("FeedBack sent..")
});




app.post("/addRequest",async(req, res)=>{
    const rnm=req.body.cRNAME;
    const rp=req.body.cRPHONE;
    const shp=req.body.cSHOPL;
    const em=req.body.cREMAIL;

    const new_req=await new ReqModel({
        RNAME:rnm,
        RPHONE:rp,
        SHOPL:shp,
        REMAIL:em,
    });
    new_req.save();
    res.send("Request sent..")
});




app.listen(8085,()=>{
    console.log("Server Started...");
});



app.get("/product-details/:id", async (req, res) => {
   
    ProModel.findById(req.params.id).then((response)=>{
        res.status(200).json(response)
    }).catch((err)=>{
        console.log("error product details")
        // console.log(err)
        res.status(400)
    })
  });

// this the new update
  app.put('/update2', async (req, res) => {
    try {
      const { _id, PNAME, PINFO, PPRICE, BRAND, IMAGE,PPTAX } = req.body; // Destructure required fields
  
      const upPro = await ProModel.findByIdAndUpdate(_id, {
        PNAME,
        PINFO,
        PPRICE,
        BRAND,
        IMAGE,
        PPTAX
      }, { new: true }); // Find and update in one operation
  
      if (upPro) {
        res.status(200).json({ message: 'Product updated successfully', product: upPro });
      } else {
        res.status(404).json({ message: 'Product not found' });
      }
    } catch (error) {
      console.error(error);
      res.status(500).json({ message: 'Internal server error' });
    }
  });