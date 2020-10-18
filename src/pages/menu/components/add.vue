<template>
  <div>
    <el-dialog
      :title="info.isAdd ? '添加菜单' : '编辑菜单'"
      :visible.sync="info.isshow"
      @closed="closed"
    >
      <el-form :model="form" :rules="rules" ref="form">
        <el-form-item
          label="菜单名称"
          :label-width="formLabelWidth"
          prop="title"
        >
          <el-input v-model="form.title" autocomplete="off"></el-input>
        </el-form-item>

        <!--  <el-form-item label="上级菜单" :label-width="formLabelWidth">
          <el-select v-model="form.region" placeholder="请选择活动区域">
            <el-option label="区域一" value="shanghai"></el-option>
            <el-option label="区域二" value="beijing"></el-option>
          </el-select>
        </el-form-item> -->

        <el-form-item label="上级菜单" :label-width="formLabelWidth">
          <el-select
            v-model="form.pid"
            placeholder="请选择上级菜单"
            @change="changePid"
          >
            <el-option label="顶级菜单" :value="0"></el-option>
            <el-option
              v-for="item in list"
              :key="item.id"
              :label="item.title"
              :value="item.id"
            ></el-option>
          </el-select>
        </el-form-item>

        <el-form-item label="菜单类型" :label-width="formLabelWidth">
          <el-radio v-model="form.type" :label="1" disabled>目录</el-radio>
          <el-radio v-model="form.type" :label="2" disabled>菜单</el-radio>
        </el-form-item>

        <el-form-item
          label="菜单图标"
          v-if="form.type == 1"
          :label-width="formLabelWidth"
          prop="icon"
        >
          <el-select v-model="form.icon" placeholder="请选择上级菜单">
            <el-option v-for="item in icons" :key="item" :value="item">
              <i :class="item"></i>
            </el-option>
          </el-select>
        </el-form-item>

        <el-form-item
          label="菜单地址"
          v-else
          :label-width="formLabelWidth"
          prop="url"
        >
          <el-select v-model="form.url" placeholder="请选择上级菜单">
            <el-option
              v-for="item in indexRoutes"
              :key="item.path"
              :label="item.name"
              :value="'/' + item.path"
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
import { indexRoutes } from "../../../router/index";
import { mapGetters, mapActions } from "vuex";
import { reqAddList, reqEditList, reqOneList } from "../../../untils/request";
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
        title: "",
        icon: "",
        type: 1,
        url: "",
        status: 1,
      },
      indexRoutes,
      value: true,
      isshow: false,
      formLabelWidth: "120px",
      rules: {
        title: [{ required: true, message: "请填写菜单名", trigger: "blur" }],
        url: [{ required: true, message: "请填写菜单地址", trigger: "blur" }],
        icon: [{ required: true, message: "请填写菜单图标", trigger: "blur" }],
      },
    };
  },
  computed: {
    ...mapGetters({
      list: "list/list",
    }),
  },
  methods: {
    ...mapActions({
      reqlist: "list/requestMenuList",
    }),
    //数据重置

    empty() {
      this.form = {
        pid: 0,
        title: "",
        icon: "",
        type: 1,
        url: "",
        status: 1,
      };
    },
    closed() {
      if (!this.info.isAdd) {
        this.empty();
      }
    },
    cancel() {
      this.info.isshow = false;
    },
    submitForm(form) {
      this.$refs.form.validate((form) => {
        if (form) {
          reqAddList(this.form).then((res) => {
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
          warningAlert("请填写完整信息");
          return false;
        }
      });
    },
    //改变type
    changePid() {
      if (this.form.pid == 0) {
        this.form.type = 1;
      } else {
        this.form.type = 2;
      }
    },
    //获取
    look(id) {
      reqOneList(id).then((res) => {
        if (res.data.code == 200) {
          this.form = res.data.list;
          this.form.id = id;
        } else {
          warningAlert(res.data.msg);
        }
      });
    },
    //修改
    updatereq() {
      reqEditList(this.form).then((res) => {
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
  },
  mounted() {
/*     reqAddList(this.form).then((res) => {
      if (res.data.code == 200) {
        successAlert(res.data.msg);

        this.empty();

        this.cancel();

        this.reqlist();
      } else {
        warningAlert(res.data.msg);
      }
    }); */
  },
};
</script>

<style></style>
