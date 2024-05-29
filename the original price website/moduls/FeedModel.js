import mongoose from "mongoose";

const FdbSchema = mongoose.Schema({
    FID:{type:String,required:true},
    FNAME:{type:String,required:true},
    FEEDBACK:{type:String,required:true},
});

const FdbModel=mongoose.model("Feedback",FdbSchema,"Feedback");
export default FdbModel;