<template>
  <div>
    <el-dialog
      :title="info.isAdd ? '添加分类' : '编辑分类'"
      :visible.sync="info.isshow"
      @closed='closed'
    >
      <el-form :model="form" :rules='rules' ref='form'>
        <el-form-item label="上级分类" :label-width="formLabelWidth">
          <el-select
            v-model="form.pid"
            placeholder="请选择上级分类"
          >
            <el-option label="顶级分类" :value="0"></el-option>
            <el-option
              v-for="item in list"
              :key="item.id"
              :label="item.catename"
              :value="item.id"
            ></el-option>
          </el-select>
        </el-form-item>

        <el-form-item label="分类名称" :label-width="formLabelWidth" prop='catename'>
          <el-input v-model="form.catename" autocomplete="off"></el-input>
        </el-form-item>

        <!--原sheng  -->
        <el-form-item label="图片" v-if='form.pid!=0' :label-width="formLabelWidth">
          <div class="fileTotal">
            <h3 class="filePlus">+</h3>
            <img v-if="imgUrl" :src="imgUrl" alt="" />
            <input v-if='info.isshow' type="file" @change='fileTop' />
          </div>
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
import { indexRoutes } from "../../../router/index";
import { mapGetters, mapActions } from "vuex";
import { reqCateAdd,reqCateEditList,reqCateInfo } from "../../../untils/request";
import {validateReqMenu} from '../../../rules'
export default {
  props: ["info"],

  data() {
    return {
      icons: [
        "el-icon-s-tools",
        "el-icon-user",
        "el-icon-camera",
        "el-icon-message-solid",
      ],
      form: {
        pid: 0,
        catename: "",
        img: null,
        status: 1,
      },
      imgUrl:'',
      indexRoutes,
      value: true,
      isshow: false,
      formLabelWidth: "120px",
      rules:{
         catename:[{required:true,message:'请填写分类名',trigger:'blur'},]// *  {validator:validateReqMenu,trigger:'blur'} *,
      }
    };
  },
  computed: {
    ...mapGetters({
      list: "type/list",
    }),
  },
  methods: {
    ...mapActions({
      reqlist: "type/requestList",
    }),
    //数据重置
    closed(){
      if(!this.info.isAdd){
        this.empty()
      }
    },
    empty() {
      this.form = {
        pid: 0,
        catename: "",
        img: null,
        status: 1,
      };
        this.imgUrl='';
    },
    cancel() {
      this.info.isshow = false;
    },
    submitForm(form){

     
        this.$refs.form.validate((form) => {
          if (form) {
                 reqCateAdd(this.form).then((res) => {
        if (res.data.code == 200) {
          successAlert(res.data.msg);

          this.empty();

          this.cancel();

          this.reqlist();
        } else {
          warningAlert(res.data.msg);
        }
      });
          } else {
              warningAlert('请填写完整信息');
            return false;
          }
        });

     
    },

    //获取
    look(id) {
      reqCateInfo(id).then((res) => {
        if (res.data.code == 200) {
          this.form = res.data.list;
          this.imgUrl=this.$imgUrl+this.form.img
          this.form.id = id;
        } else {
          warningAlert(res.data.msg);
        }
      });
    },
    //修改
    updatereq() {
      reqCateEditList(this.form).then((res) => {
        if (res.data.code == 200) {
          
          successAlert(res.data.msg);
          this.empty();
          this.cancel();
          this.reqlist();
        } else {
          warningAlert(res.data.msg);
        }
      });
    },

    //fileTop
    fileTop(e){
      // e.target.files 文件对象
      // console.log(e.target.files);
      console.log(e)
      let files=e.target.files[0];
      let size=files.size;
      let pic=['.jpg','.png','.jpeg','.gif']
      let flag=pic.some(item=>files.name.slice(files.name.lastIndexOf('.'))) 
      
      //   console.log(files)

      if(!flag){
        warningAlert('不是图片类型')
          return;
      }

      if(size>2*1024*1024){
         warningAlert('图片内容太大')
         return;
      }
       this.imgUrl= URL.createObjectURL(files)
      console.log(this.imgUrl)
      // this.imgUrl = URL.createObjectURL(file);
      this.form.img=files;

    }
  },
  mounted() {},
};
</script>

<style scoped>
.fileTotal {
  width: 150px;
  height: 150px;
  border: 1px dashed #ccc;
  position: relative;
}
.filePlus {
  line-height: 150px;
  text-align: center;
  font-weight: normal;
  font-size: 30px;
}

.fileTotal img,
input {
  position: absolute;
  width: 100%;
  height: 100%;
  left: 0;
  top: 0;
}
.fileTotal input {
  position: absolute;
  opacity: 0;
}
</style>
