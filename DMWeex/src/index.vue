<template>
  <div class="wrapper">
    <!-- <image :src="logo" class="logo" />
    <text class="greeting">The environment is ready!</text>
    <HelloWorld/> -->
    <text style="font-size: 40px">oninput: {{input_todo}}</text>
    <input type="text" placeholder="Input Text" class="input" :autofocus=true v-model="input_todo" @change="onchange" @input="oninput"/>
    <text @click="submitAction">提交</text>
    <!-- <ul>
      <li v-for="item in list">{{item}}</li>
    </ul> -->
    <list class="list">
    <cell class="cell" v-for="(num,index) in list" :key="index">
      <div class="panel">
        <text class="text">{{num}}</text>
      </div>
    </cell>
  </list>
  </div>
</template>

<script>
// import HelloWorld from './components/HelloWorld'
export default {
  name: 'App',
  components: {
    // HelloWorld
  },
  data () {
    return {
      // logo: 'https://gw.alicdn.com/tfs/TB1yopEdgoQMeJjy1XaXXcSsFXa-640-302.png'
      list: [],
      input_todo: ''
    }
  },
  methods: {
    onchange: function(event){
      console.log('onchange',event.value);
    },
    oninput: function (event) {
      console.log('oninput', event.value);
    },
    submitAction: function () {
      console.log(this.input_todo);
      this.list.push(this.input_todo);
      this.input_todo = "";
    }
  }
}
</script>

<style scoped>
.list {
  width: 750px;
  height: 800px;
}
.panel {
    width: 600px;
    height: 300px;
    margin-left: 75px;
    margin-right: 75px;
    margin-top: 35px;
    margin-bottom: 35px;
    flex-direction: column;
    justify-content: center;
    border-width: 2px;
    border-style: solid;
    border-color: rgb(162, 217, 192);
    background-color: rgba(162, 217, 192, 0.2);
  }
  .text {
    font-size: 88px;
    text-align: center;
    color: #41B883;
  }
  .input {
    height: 80px;
    width: 620px;
    background-color:  #F0F0F0;
    margin-left: 30px;
    margin-right: 100px;
  }
  .wrapper {
    justify-content: center;
    align-items: center;
  }
  .logo {
    width: 424px;
    height: 200px;
  }
  .greeting {
    text-align: center;
    margin-top: 70px;
    font-size: 50px;
    color: #41B883;
  }
  .message {
    margin: 30px;
    font-size: 32px;
    color: #727272;
  }
</style>
