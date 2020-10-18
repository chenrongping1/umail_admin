<template>
  <div>
    <el-dialog
      :title="info.isAdd ? '添加菜单' : '编辑菜单'"
      :visible.sync="info.isshow"
      @closed='closed'
      @opened='opened'
    >
      <el-form :model="form" :rules="rules" ref='form'>
        <el-form-item label="活动名称" :label-width="formLabelWidth" prop='title'>
          <el-input v-model="form.title" autocomplete="off" ></el-input>
        </el-form-item>

        <el-form-item label="活动期限" :label-width="formLabelWidth" prop='date'>
          <div class="block">
            <el-date-picker
              v-model="date"
              type="daterange"
              range-separator="至"
              start-placeholder="开始日期"
              end-placeholder="结束日期"
              @change="qqq"
            >
            </el-date-picker>
          </div>
        </el-form-item>

        <el-form-item label="一级分类" :label-width="formLabelWidth" prop='first_cateid'>
          <el-select
            v-model="form.first_cateid"
            placeholder="请选择上级菜单"
            @change="changeOne"
            v-if='typeList'
          >
            <el-option label="顶级菜单" :value="0"></el-option>
            <el-option
              v-for="item in typeList"
              :key="item.id"
              :label="item.catename"
              :value="item.id"
            ></el-option>
          </el-select>
        </el-form-item>

        <el-form-item label="二级分类" :label-width="formLabelWidth" prop='second_cateid'>
          <el-select
            v-model="form.second_cateid"
            placeholder="请选择上级菜单"
            @change="changeTwo"
            v-if='secondArr'
          >
            <el-option label="顶级菜单" :value="0"></el-option>
            <el-option
              v-for="item in secondArr"
              :key="item.id"
              :label="item.catename"
              :value="item.id"
            >
            </el-option>
          </el-select>
        </el-form-item>

        <el-form-item label="商品" :label-width="formLabelWidth" prop='goodsid'>
          <el-select v-model="form.goodsid" placeholder="请选择上级菜单"   v-if='goodsList'>
            <el-option
              v-for="item in goodsList"
              :key="item.id"
              :label="item.goodsname"
              :value="item.id"
            >
            </el-option>
          </el-select>
        </el-form-item>

        <el-form-item label="状态" :label-width="formLabelWidth">
          <el-switch
            v-model="form.status"
            :active-value="1"
            :inactive-value="2"
          ></el-switch>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button @click="isshow = false">取 消</el-button>
        <el-button type="primary" @click="submitForm(form)" v-if="info.isAdd"
          >确 定</el-button
        >

        <el-button type="primary" @click="updatereq" v-else>修改</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import { warningAlert, successAlert } from "../../../untils/alert";
import { mapGetters, mapActions } from "vuex";
import {
  reqSeckillEditList,
  reqSeckillInfo,
  reqSeckillAdd,
  reqCateList,
} from "../../../untils/request";
export default {
  props: ["info"],

  data() {
    return {
     
      date:[],
      secondArr: [],

      form: {
        title: "",
        begintime: "",
        endtime: 1,
        first_cateid: "",
        second_cateid: "",
        goodsid: "",
        status: 1,
      },
      value: true,
      isshow: false,
      formLabelWidth: "120px",
       rules:{
         title:[{required:true,message:'请填写活动名',trigger:'blur'}],
          goodsid:[{required:true,message:'请填写商品',trigger:'blur'}],
         /*  date:[{required:true,message:'请填写日期',trigger:'blur'}], */
          first_cateid:[{required:true,message:'请填写一级分类',trigger:'blur'}],
          seconed_cateid:[{required:true,message:'请填写二级分类',trigger:'blur'}],

       }
    };
  },
  computed: {
    ...mapGetters({
      typeList: "type/list",
      goodsList: "goods/list",
    }),

  },
  methods: {
    ...mapActions({
      reqtypeList: "type/requestList",
      reqGoodsList: "goods/requestList",
      reqList:'seckill/requestList'
    }),
    qqq(){
      console.log(typeof this.date[0])
    }
    ,
       closed(){
      if(!this.info.isAdd){
        this.empty()
      }
    },
    //数据重置
    changeOne() {
      this.form.second_cateid = "";
      this.reqCate();
    },
    //请求二级
    reqCate() {
  
        reqCateList({ pid: this.form.first_cateid }).then((res) => {
          // console.log(res)
          this.secondArr = res.data.list;
        });
  

    },
    changeTwo() {
      this.form.goodsid = "";
      this.reqGoods();
      // console.log(this.goodsList)
    },
    //请求三级
    reqGoods() {
      this.reqGoodsList({
        fid: this.form.first_cateid,
        sid: this.form.second_cateid,
      });
      console.log("qq", this.goodsList);
    },
    empty() {
      this.form = {
        title: "",
        begintime: "",
        endtime: 1,
        first_cateid: "",
        second_cateid: "",
        goodsid: "",
        status: 1,
      };
      this.date=[];
      this.secondArr=[];
    },
    cancel() {
      this.info.isshow = false;
    },
    submitForm(form) {


      
        this.$refs.form.validate((form) => {
          if (form) {
             console.log(this.date)
      this.form.begintime=this.date[0].getTime();
      this.form.endtime=this.date[1].getTime();
      console.log(this.form)
      reqSeckillAdd(this.form).then((res) => {
        if (res.data.code == 200) {
          successAlert(res.data.msg);

          this.empty();

          this.cancel();

          this.reqList();
        } else {
          warningAlert(res.data.msg);
        }
      });
          } else {
              warningAlert(res.data.msg);
            return false;
          }
        });
     
    },
    


/* formatDate(time) {
    let date = new Date(time)
    let year = date.getFullYear()
    let month = (date.getMonth() + 1 + "").padStart(2, "0")
    let day = (date.getDate() + "").padStart(2, "0")
    let hours = (date.getHours() + "").padStart(2, "0")
    let minutes = (date.getMinutes() + "").padStart(2, "0")
    let seconds = (date.getSeconds() + "").padStart(2, "0")
    return `${year}-${month}-${day} ${hours}:${minutes}:${seconds}`
} 
,*/
    //获取
    opened(){

    },
    look(id) {
      reqSeckillInfo(id).then((res) => {
        if (res.data.code == 200) {
          /*
           */ 
          this.form = res.data.list;
          this.reqCate();
          this.reqGoods();
         
          this.$set(this.date,0,new Date(Number(this.form.begintime)));
          this.$set(this.date,1,new Date(Number(this.form.endtime)))
          ; 
          this.form.id = id;
          // this.date[0]= new Date(Number(this.form.begintime))+''
          // this.date[1]= new Date(Number(this.form.endtime))+''
          // this.date.splice(0,0,'')
        
          console.log(this.date)
          this.secondArr=res.data.list;
        } else {
          warningAlert(res.data.msg);
        }
      });
    },
    //修改
    updatereq() {
      reqSeckillEditList(this.form).then((res) => {
        if (res.data.code == 200) {
          successAlert(res.data.msg);
          this.empty();
          this.cancel();
          this.reqList();
        } else {
          warningAlert(res.data.msg);
        }
      });
    },
  },
  mounted() {
    this.reqtypeList();
  }
};
</script>

<style></style>
