<template>
  <div>
    <el-container class="total">
      <el-aside width="200px" class="left">
        <!-- 菜单 -->
        <!-- router 确定index为路由跳转 -->
        <!-- unique-opened 子菜单唯一展开 -->
        <el-menu
          default-active="1"
          class="el-menu-vertical-demo"
          @open="handleOpen"
          @close="handleClose"
          background-color="rgb(32, 34, 42)"
          text-color="#fff"
          active-text-color="#ffd04b"
          router
          unique-opened
        >
          <el-menu-item index="/home">
            <i class="el-icon-menu"></i>
            <span slot="title">首页</span>
          </el-menu-item>

          <div v-for="item in userInfo.menus" :key="item.id">
            <!-- 目录 -->
            <el-submenu :index="item.id + ''" v-if="item.children">
              <template slot="title">
                <i :class="item.icon"></i>
                <span>{{ item.title }}</span>
              </template>
              <el-menu-item-group>
                <el-menu-item
                  v-for="i in item.children"
                  :key="i.id"
                  :index="i.url"
                  >{{ i.title }}</el-menu-item
                >
              </el-menu-item-group>
            </el-submenu>

            <!-- 菜单 -->
            <el-menu-item v-else :index="item.url">{{
              item.title
            }}</el-menu-item>
          </div>

          <!--  <el-submenu index="2">
            <template slot="title">
              <i class="el-icon-s-tools"></i>
              <span>系统设置</span>
            </template>
            <el-menu-item-group>
              <template slot="title"></template>
              <el-menu-item index="/menu" >菜单管理</el-menu-item>
              <el-menu-item index="/role">角色管理</el-menu-item>
              <el-menu-item index="/manager">管理员管理</el-menu-item>
            </el-menu-item-group>
          </el-submenu>

          <el-submenu index="3">
            <template slot="title">
              <i class="el-icon-goods"></i>
              <span>商品管理</span>
            </template>
            <el-menu-item-group>
              <template slot="title"></template>
              <el-menu-item index="/type">商品分类</el-menu-item>
              <el-menu-item index="/specs">商品规格</el-menu-item>
              <el-menu-item index="/product">商品管理</el-menu-item>
              <el-menu-item index="/member">会员管理</el-menu-item>
              <el-menu-item index="/banner">轮播图管理</el-menu-item>
              <el-menu-item index="/seskill">秒杀活动</el-menu-item>
            </el-menu-item-group>
          </el-submenu> -->
        </el-menu>
      </el-aside>
      <el-container>
        <!-- 头 -->
        <el-header class="top">
          <div class="hearder">
            <div>欢迎您，{{ userInfo.username }}</div>
            <i class="el-icon-s-tools" @click="isshow=true"></i>
          </div>
        </el-header>
        <!-- 主体 -->
        <el-main class="main">
          <!-- 设计二级路由 -->
          <el-breadcrumb separator="/" v-if="$route.name">
            <el-breadcrumb-item :to="{ path: '/' }">首页</el-breadcrumb-item>
            <el-breadcrumb-item>{{ $route.name }}</el-breadcrumb-item>
          </el-breadcrumb>
          <router-view class="two"></router-view>
        </el-main>
      </el-container>
    </el-container>
    <el-dialog
      title="提示"
      :visible.sync="isshow"
      width="30%"
      :before-close="handleClose"
    >
      <span>您确定退出吗? {{userInfo.username}}</span>
      <span slot="footer" class="dialog-footer">
        <el-button @click="isshow = false">取 消</el-button>
        <el-button type="primary" @click="loginOut" >确 定</el-button>
      </span>
    </el-dialog>
  </div>
</template>

<script>
import { mapGetters, mapActions } from "vuex";
import { successAlert } from '../../untils/alert';
export default {
  data() {
    return {
      isshow: false,
    };
  },
  computed: {
    ...mapGetters({
      userInfo: "userInfo",
    }),
  },

  methods: {
    ...mapActions({
      reqUserInfo: "reqUserInfo",
    }),
    loginOut() {
      successAlert('退出成功')
       this.reqUserInfo({});
      this.$router.push("/login");
      this.isshow=false;
     
    },
    handleOpen(key, keyPath) {
      console.log(key, keyPath);
    },
    handleClose(key, keyPath) {
      console.log(key, keyPath);
    },
  },
  mounted() {
    console.log(this.userInfo);
  },
};
</script>

<style scoped>
.picker {
  width: 100vw;
  height: 100vh;
  background: rgba(0, 0, 0, 0.5);
  display: flex;
  justify-content: center;
  align-items: center;
}

.total {
  width: 100vw;
  height: 100vh;
}
.left {
  background-color: rgb(32, 34, 42);
}
.top {
  background-color: rgb(179, 192, 209);
  display: flex;
  justify-content: center;
  align-items: center;
}
.two {
  margin-top: 20px;
}
.hearder {
  display: flex;
}
</style>