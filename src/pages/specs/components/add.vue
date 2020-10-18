<template>
  <div>
    <el-dialog
      :title="info.isAdd ? '添加规格' : '编辑规格'"
      :visible.sync="info.isshow"
      @closed="closed"
    >
      <el-form ref="form" :model="form" :rules="rules">
        <el-form-item
          label="规格名称"
          :label-width="formLabelWidth"
          prop="specsname"
        >
          <el-input v-model="form.specsname" autocomplete="off"></el-input>
        </el-form-item>

        <el-form-item
          label="规格属性"
          v-for="(item, index) in sumSpecs"
          :key="index"
          :label-width="formLabelWidth"
        
        >
          <div class="total" >
            <el-input v-model="item.value" autocomplete="off"></el-input>
            <el-button type="primary" v-if="index == 0" @click="addAttr"
              >新增属性</el-button
            >
            <el-button type="danger" v-else @click="delAttr(index)"
              >删除</el-button
            >
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
import { warningAlert, successAlert } from "../../../untils/alert";
import { indexRoutes } from "../../../router/index";
import { mapGetters, mapActions } from "vuex";
import {
  reqSpecsEditList,
  reqSpecsInfo,
  reqSpecsAdd,
} from "../../../untils/request";
export default {
  props: ["info"],
  data() {
    return {
      sumSpecs: [{ value: "" }, { value: "" }],
      form: {
        specsname: "",
        attrs: "",
        status: 1,
      },
      indexRoutes,
      value: true,
      isshow: false,
      formLabelWidth: "120px",
      rules: {
        specsname: [
          { required: true, message: "请填写规格名", trigger: "blur" },
        
        ],
     /*    value: [{ required: true, message: "请填写规格属性", trigger: "blur" }], */
      },
    };
  },
  computed: {
    ...mapGetters({}),
  },
  methods: {
    ...mapActions({
      reqlist: "specs/requestList",
      reqCount: "specs/requestCount",
    }),
    //数据重置
    empty() {
      this.form = {
        specsname: "",
        attrs: "",
        status: 1,
      };
      this.sumSpecs = [{ value: "" }, { value: "" }];
    },
    closed() {
      if (!this.info.isAdd) {
        this.empty();
      }
    },
    cancel() {
      this.info.isshow = false;
    },
    /*  format(){
        if(!this.form.specsname){
            warningAlert('规格名称必须填写')
            return false;
        }

        if(this.sumSpecs.some(val=>!val.value)){ 
          warningAlert('规格属性必须填写')
          return false;
        }
        return true;
         
    }, */
    //添加
    submitForm(form) {
      this.$refs.form.validate((form) => {
        if (form) {
          this.form.attrs = JSON.stringify(
            this.sumSpecs.map((item) => item.value)
          );
          console.log(this.form.attrs);
          reqSpecsAdd(this.form).then((res) => {
            if (res.data.code == 200) {
              successAlert(res.data.msg);

              this.empty();

              this.cancel();

              this.reqlist();
              this.reqCount();
            } else {
              warningAlert(res.data.msg);
            }
          });
        } else {
          warningAlert('请填写信息');
          return false;
        }
      });
    },

    //获取
    look(id) {
      reqSpecsInfo(id).then((res) => {
        if (res.data.code == 200) {
          res.data.list[0].attrs;
          //  console.log(typeof res.data.list[0].attrs)
          this.form = res.data.list[0];

          this.sumSpecs = JSON.parse(this.form.attrs).map((val) => ({
            value: val,
          }));
        } else {
          warningAlert(res.data.msg);
        }
      });
    },
    //修改
    updatereq() {
      if (!this.format()) {
        return;
      }
      this.form.attrs = JSON.stringify(this.sumSpecs.map((val) => val.value));
      reqSpecsEditList(this.form).then((res) => {
        if (res.data.code == 200) {
          successAlert(res.data.msg);
          this.empty();
          this.cancel();
          this.reqlist();
          this.reqCount();
        } else {
          warningAlert(res.data.msg);
        }
      });
    },
    //新增
    addAttr() {
      this.sumSpecs.push({ value: "" });
    },

    //删除
    delAttr(i) {
      this.sumSpecs.splice(i, 1);
    },
  },

  mounted() {
    this.reqCount();
  },
};
</script>

<style scoped>
.total {
  display: flex;
}
</style>
