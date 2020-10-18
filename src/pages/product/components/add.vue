<template>
  <div>
    <el-dialog
      :title="info.isAdd ? '添加商品' : '编辑商品'"
      :visible.sync="info.isshow"
      @opened="opened"
      @closed="closed"
    >
      <el-form ref="form" :model="form" :rules="rules">
        <el-form-item label="一级分类" :label-width="formLabelWidth">
          <el-select
            v-model="form.first_cateid"
            placeholder="请选择"
            @change="changeType"
          >
            <el-option label="顶级分类" value="" disabled></el-option>
            <el-option
              v-for="item in typeList"
              :key="item.id"
              :label="item.catename"
              :value="item.id"
            ></el-option>
          </el-select>
        </el-form-item>

        <el-form-item label="二级分类" :label-width="formLabelWidth">
          <el-select v-model="form.second_cateid" placeholder="请选择上级分类">
            <el-option label="顶级分类" value="" disabled></el-option>
            <el-option
              v-for="item in secondArr"
              :key="item.id"
              :label="item.catename"
              :value="item.id"
            ></el-option>
          </el-select>
        </el-form-item>

        <el-form-item label="商品名称" prop="goodsname" :label-width="formLabelWidth">
          <el-input v-model="form.goodsname" autocomplete="off" @change='ssss'></el-input>
        </el-form-item>

        <el-form-item label="价格" :label-width="formLabelWidth" prop='price'>
          <el-input v-model="form.price" autocomplete="off"></el-input>
        </el-form-item>

        <el-form-item label="市场价格" :label-width="formLabelWidth"  prop='market_price'>
          <el-input v-model="form.market_price" autocomplete="off"></el-input>
        </el-form-item>

        <el-form-item
          label="图片"
          v-if="form.pid != 0"
          :label-width="formLabelWidth"
        >
          <div class="fileTotal">
            <h3 class="filePlus">+</h3>
            <img v-if="imgUrl" :src="imgUrl" alt="" />
            <input v-if="info.isshow" type="file" @change="fileTop" />
          </div>
        </el-form-item>

        <el-form-item label="商品规格" :label-width="formLabelWidth">
          <el-select
            v-model="form.specsid"
            placeholder="请选择上级分类"
            @change="changeSpece"
          >
            <el-option label="二级分类" value="" disabled></el-option>
            <el-option
              v-for="item in specsList"
              :key="item.id"
              :label="item.specsname"
              :value="item.id"
            ></el-option>
          </el-select>
        </el-form-item>

        <el-form-item label="规格属性" :label-width="formLabelWidth" prop='specsattr'>
          <el-select
            v-model="form.specsattr"
            placeholder="请选择上级分类"
            multiple
          >
            <el-option label="顶级分类" value="" disabled></el-option>
            <el-option
              v-for="item in specsArr"
              :key="item"
              :label="item"
              :value="item"
            ></el-option>
          </el-select>
        </el-form-item>

        <el-form-item label="是否新品" :label-width="formLabelWidth">
          <el-radio v-model="form.isnew" :label="1">是</el-radio>
          <el-radio v-model="form.isnew" :label="2">否</el-radio>
        </el-form-item>

        <el-form-item label="是否热卖" :label-width="formLabelWidth">
          <el-radio v-model="form.ishot" :label="1">是</el-radio>
          <el-radio v-model="form.ishot" :label="2">否</el-radio>
        </el-form-item>

        <el-form-item label="状态" :label-width="formLabelWidth">
          <el-switch
            v-model="form.status"
            :active-value="1"
            :inactive-value="2"
          ></el-switch>
        </el-form-item>

        <el-form-item label="商品描述" :label-width="formLabelWidth">
          <div v-if="info.isshow" id="editor"></div>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button @click="info.isshow = false">取 消</el-button>
        <el-button type="primary" @click="submitForm(form)" v-if="info.isAdd"
          >确 定</el-button
        >

        <el-button type="primary" @click="updatereq" v-else>修改</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import E from "wangeditor";
import { warningAlert, successAlert } from "../../../untils/alert";
import { mapGetters, mapActions } from "vuex";
import {
  reqCateList,
  reqGoodsAdd,
  reqGoodsEditList,
  reqGoodsInfo,
} from "../../../untils/request";
import { isInteger } from '../../../rules';
export default {
  props: ["info"],
  data() {
    return {
      value: true,
      isshow: false,
      formLabelWidth: "120px",
      imgUrl: "",
      secondArr: [],
      specsArr: [],
      form: {
        first_cateid: "",
        second_cateid: "",
        goodsname: "",
        price: "",
        market_price: "",
        img: null,
        description: "",
        specsid: "",
        specsattr: "",
        isnew: 1,
        ishot: 1,
        status: 1,
      },
      rules: {
        goodsname: [
          {
            required: true, //是否必填
            message: "请填写商品名称", //规则
            trigger: "blur", //何事件触发
          },
          
        ],
            price: [
          {
            required: true, //是否必填
            message: "请填写价格", //规则
            trigger: "blur", //何事件触发
          },
          {validator:isInteger,trigger:'blur'}
        ],
 market_price: [
    {
            required: true, //是否必填
            message: "请填写市场价格", //规则
            trigger: "blur", //何事件触发
          },
          {validator:isInteger,trigger:'blur'}
        
        ],
           specsattr: [
          {
            required: true, //是否必填
            message: "请填写规格属性", //规则
            trigger: "blur,change", //何事件触发
          },]
      },
    };
  },
  computed: {
    ...mapGetters({
      typeList: "type/list",
      specsList: "specs/list",
      goodsList: "goods/list",
    }),
  },
  methods: {
    ...mapActions({
      requestType: "type/requestList",
      reqCount: "goods/requestCount",
      reqSpecs: "specs/requestList",
      reqgoods: "goods/requestList",
    }),
    ssss(){
        console.log(this.rules.goodsname[0].message)
    },
    closed() {
      if (!this.info.isAdd) {
        this.empty();
      }
    },
    fileTop(e) {
      // e.target.files 文件对象
      // console.log(e.target.files);
      console.log(e);
      let files = e.target.files[0];
      let size = files.size;
      let pic = [".jpg", ".png", ".jpeg", ".gif"];
      let flag = pic.some((item) =>
        files.name.slice(files.name.lastIndexOf("."))
      );

      //   console.log(files)

      if (!flag) {
        warningAlert("不是图片类型");
        return;
      }

      if (size > 2 * 1024 * 1024) {
        warningAlert("图片内容太大");
        return;
      }
      this.imgUrl = URL.createObjectURL(files);
      console.log(this.imgUrl);
      // this.imgUrl = URL.createObjectURL(file);
      this.form.img = files;
    },
    opened() {
      // console.log('1')
      this.editor = new E("#editor");
      this.editor.create();
      this.editor.txt.html(this.form.description);
    },
    //数据重置
    empty() {
      this.form = {
        first_cateid: "",
        second_cateid: "",
        goodsname: "",
        price: "",
        market_price: "",
        img: null,
        description: "",
        specsid: "",
        specsattr: "",
        isnew: 1,
        ishot: 1,
        status: 1,
      };
      this.secondArr = [];
      this.specsArr = [];
      this.imgUrl = "";
    },
    cancel() {
      this.info.isshow = false;
    },
    format() {
      if (!this.form.specsname) {
        warningAlert("规格名称必须填写");
        return false;
      }

      if (this.sumSpecs.some((val) => !val.value)) {
        warningAlert("规格属性必须填写");
        return false;
      }
      return true;
    },
    //添加
    submitForm(form) {

        this.$refs.form.validate((form) => {
          if (form) {
                  // console.log(this.form)
      this.form.description = this.editor.txt.html();
      this.form.specsattr = JSON.stringify(this.form.specsattr);
      reqGoodsAdd(this.form).then((res) => {
        if (res.data.code == 200) {
          successAlert(res.data.msg);
          this.empty();
          this.cancel();
          this.reqgoods();
          this.reqCount();
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
      reqGoodsInfo(id).then((res) => {
        // console.log(res)
        // this.res.data.specsattr
        if (res.data.code == 200) {
          this.form = res.data.list;
          this.form.id = id;
          this.imgUrl=this.$imgUrl+this.form.img
          this.secondArr = JSON.parse(this.form.second_cateid);
          this.specsArr = JSON.parse(this.form.specsattr);
          this.form.specsattr = JSON.parse(this.form.specsattr);
          this.imgUrl = this.$imgUrl + this.form.img;
        } else {
          warningAlert(res.data.msg);
        }
      });
    },
    //修改
    updatereq() {
      this.form.description = this.editor.txt.html();
      this.form.specsattr = JSON.stringify(this.form.specsattr);
      reqGoodsEditList(this.form).then((res) => {
        if (res.data.code == 200) {
          successAlert(res.data.msg);
          this.empty();
          this.cancel();
          this.reqgoods();
          this.reqCount();
        } else {
          warningAlert(res.data.msg);
        }
      });
    },
    changeType() {
      // console.log(111)
      this.form.second_cateid = "";
      reqCateList({ pid: this.form.first_cateid }).then((res) => {
        console.log(res);
        this.secondArr = res.data.list;
      });
    },
    changeSpece() {
      this.form.specsattr = "";
      let obj = this.specsList.find((val) => val.id == this.form.specsid);
      console.log(obj);
      this.specsArr = obj.attrs;
    },
  },

  mounted() {
    // this.reqCount();
    //  reqTypelist()
    this.requestType();
    this.reqSpecs(true);
  },
};
</script>

<style scoped>
.total {
  display: flex;
}

img {
  width: 100%;
  height: 100%;
}
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
