<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Xiehe Sanlin Bilingual School Canteen Pre-order System</title>
<script src="https://cdn.jsdelivr.net/npm/qrcode@1.5.1/build/qrcode.min.js"></script>
<style>
*{box-sizing:border-box;margin:0;padding:0;font-family:"Segoe UI",sans-serif}
:root{
  --bg:#e8f0fe;
  --card:#ffffff;
  --header:#2b5b9c;
  --primary:#2b5b9c;
  --success:#219653;
  --danger:#d93025;
  --grey:#8892a0;
  --text:#333;
  --border:#cbd5e1;
}
.theme-2{
  --bg:#f4f9f0;
  --card:#ffffff;
  --header:#2c7873;
  --primary:#2c7873;
  --success:#4caf50;
  --danger:#e53935;
  --grey:#78909c;
  --text:#222;
  --border:#b2d8d8;
}
.theme-3{
  --bg:#fff8f0;
  --card:#fffefb;
  --header:#9c27b0;
  --primary:#9c27b0;
  --success:#00bfa5;
  --danger:#ff5252;
  --grey:#90a4ae;
  --text:#333;
  --border:#e1bee7;
}
body{background:linear-gradient(135deg,var(--bg),#f0f8ff);min-height:100vh;padding:20px;color:var(--text)}
.wrapper{max-width:1150px;margin:0 auto}
.header-bar{display:flex;justify-content:space-between;align-items:center;background:var(--header);color:#fff;padding:16px 24px;border-radius:14px;box-shadow:0 4px 12px #00000018;margin-bottom:20px;flex-wrap:wrap;gap:10px}
.header-controls{display:flex;gap:8px;align-items:center}
.lang-btn,.theme-btn{padding:9px 16px;border:none;border-radius:9px;background:#ffffff;color:var(--primary);font-weight:bold;cursor:pointer;font-size:15px}
.card{background:var(--card);border-radius:14px;padding:22px;margin-bottom:18px;box-shadow:0 3px 10px #00000012;border:1px solid var(--border)}
.card h2{color:var(--primary);margin-bottom:16px;font-size:20px}
.card h3{color:var(--primary);margin:12px 0 8px;font-size:17px}
input,select,textarea{width:100%;padding:11px;margin:9px 0;border:1px solid var(--border);border-radius:9px;font-size:15px;background:#fff}
textarea{min-height:80px;resize:vertical}
button{padding:11px 16px;border:none;border-radius:9px;cursor:pointer;font-size:15px;margin:5px}
.btn-primary{background:var(--primary);color:white}
.btn-success{background:var(--success);color:white}
.btn-danger{background:var(--danger);color:white}
.btn-grey{background:var(--grey);color:white}
.btn-third{background:#7b61ff;color:white}
.btn-quickadmin{background:#ff9800;color:white;width:100%;margin-top:8px}
.btn-reset{background:#444;color:white;width:100%;margin-top:8px}
.login-container{max-width:480px;margin:40px auto}
.login-tab-group{display:flex;gap:4px;margin-bottom:20px;flex-wrap:wrap}
.login-tab{flex:1;min-width:90px;text-align:center;padding:10px 6px;border-radius:9px;border:1px solid var(--primary);color:var(--primary);cursor:pointer;font-weight:500;font-size:13px}
.login-tab.active{background:var(--primary);color:#fff}
.login-btn-group{display:flex;gap:10px;margin-top:10px;flex-wrap:wrap}
.order-row{display:flex;justify-content:space-between;padding:10px 0;border-bottom:1px solid #e2e8f0;align-items:center;flex-wrap:wrap;gap:8px}
.food-name{cursor:pointer;color:var(--primary);font-weight:500}
.quantity-input{width:70px}
.hidden{display:none !important}
.user-item{display:flex;gap:10px;align-items:center;padding:12px;border-bottom:1px solid #eee;flex-wrap:wrap}
.user-item input{width:120px;margin:0 4px}
.logout-area{display:flex;justify-content:space-between;align-items:center;margin-bottom:12px;flex-wrap:wrap;gap:10px}
.balance-box{background:var(--success);color:#fff;padding:10px 16px;border-radius:10px;font-weight:bold}
.modal-overlay{position:fixed;inset:0;background:rgba(0,0,0,0.4);display:flex;align-items:center;justify-content:center;z-index:999}
.modal{background:#fff;padding:28px;border-radius:14px;max-width:440px;width:90%;text-align:left}
.modal.center{text-align:center}
.modal p{margin-bottom:10px;font-size:16px}
.pwd-wrap{position:relative;width:100%}
.pwd-wrap input{padding-right:44px;margin:9px 0}
.pwd-eye{position:absolute;right:14px;top:50%;transform:translateY(-50%);cursor:pointer;font-size:22px;color:#666;user-select:none}
.food-tab-group{display:flex;gap:6px;margin-bottom:16px;flex-wrap:wrap}
.food-tab{padding:10px 14px;border-radius:9px;border:1px solid var(--primary);color:var(--primary);cursor:pointer}
.food-tab.active{background:var(--primary);color:#fff}
.star{color:#ffb800;cursor:pointer;font-size:22px}
.star-empty{color:#ccc}
.comment-item{border-top:1px solid #eee;padding:10px 0;margin-top:8px}
#qrCanvas{margin:12px auto;display:block}
.third-option{padding:8px 12px;border:1px solid var(--border);border-radius:8px;margin:4px;cursor:pointer}
.third-option.active{background:var(--primary);color:#fff;border-color:var(--primary)}
table{width:100%;border-collapse:collapse;margin-top:10px}
th,td{border:1px solid var(--border);padding:8px 12px;text-align:left;font-size:14px}
th{background:var(--bg);color:var(--primary)}
</style>
</head>
<body>
<div class="wrapper">
  <div class="header-bar">
    <h1 id="sysTitle" style="font-size:22px;">Xiehe Sanlin Bilingual School Canteen Pre-order System</h1>
    <div class="header-controls">
      <select id="themeSelect" onchange="changeTheme(this.value)" style="width:auto;margin:0;padding:6px 10px;">
        <option value="default">Blue Theme</option>
        <option value="theme-2">Green Theme</option>
        <option value="theme-3">Purple Theme</option>
      </select>
      <button class="lang-btn" id="langSwitch" onclick="toggleLang()">中文</button>
    </div>
  </div>

  <!-- 通用提示彈窗 -->
  <div id="modal" class="modal-overlay hidden">
    <div class="modal center">
      <p id="modalText"></p>
      <button class="btn-primary" onclick="closeModal()">OK</button>
    </div>
  </div>

  <!-- 第三方登入彈窗 -->
  <div id="thirdModal" class="modal-overlay hidden">
    <div class="modal center">
      <h3 id="thirdTitleText">Third-party Login Options</h3>
      <div style="display:flex;flex-wrap:wrap;justify-content:center;margin:10px 0">
        <div class="third-option" data-type="qq" onclick="selectThird('qq')">QQ</div>
        <div class="third-option" data-type="google" onclick="selectThird('google')">Google</div>
        <div class="third-option" data-type="wechat" onclick="selectThird('wechat')">WeChat</div>
        <div class="third-option" data-type="school" onclick="selectThird('school')">School Auth</div>
      </div>
      <div id="qrWrap" class="hidden">
        <canvas id="qrCanvas"></canvas>
        <p id="scanTip" style="font-size:13px;color:#666;margin-top:6px;">Please scan QR code to authorize</p>
        <button class="btn-grey" onclick="refreshQr()">Refresh QR</button>
        <br><br>
        <button class="btn-success" id="thirdLoginBtn" onclick="doThirdLogin()">Confirm Login</button>
      </div>
      <br>
      <button class="btn-grey" onclick="closeThirdModal()">Cancel</button>
    </div>
  </div>

  <!-- 菜品詳情與評論彈窗 -->
  <div id="foodDetailModal" class="modal-overlay hidden">
    <div class="modal" style="max-height:85vh;overflow-y:auto;">
      <h3 id="detailFoodName"></h3>
      <p><strong>Calories:</strong> <span id="detailCal"></span> kcal</p>
      <p><strong>Ingredients:</strong> <span id="detailIng"></span></p>
      <p><strong>Nutrition:</strong> <span id="detailNut"></span></p>
      <hr style="margin:12px 0;">
      <p><strong>Rating:</strong> <span id="starBox"></span></p>
      <textarea id="commentInput" placeholder="Write your comment here..."></textarea>
      <button class="btn-success" onclick="submitComment()">Submit Comment</button>
      <h4 style="margin-top:14px;">Reviews</h4>
      <div id="commentList"></div>
      <div style="text-align:right;margin-top:14px;">
        <button class="btn-grey" onclick="closeFoodModal()">Close</button>
      </div>
    </div>
  </div>

  <!-- 登入頁面 -->
  <div id="loginPage" class="login-container">
    <div class="card">
      <h2 id="loginTitleText">System Login</h2>
      <div class="login-tab-group">
        <div class="login-tab active" data-role="student" onclick="switchLoginTab('student')">Student</div>
        <div class="login-tab" data-role="staff" onclick="switchLoginTab('staff')">Teacher</div>
        <div class="login-tab" data-role="canteen" onclick="switchLoginTab('canteen')">Canteen Staff</div>
        <div class="login-tab" data-role="admin" onclick="switchLoginTab('admin')">Admin</div>
      </div>
      <input type="text" id="loginUser" placeholder="Username">
      <div class="pwd-wrap">
        <input type="password" id="loginPwd" placeholder="Password">
        <span class="pwd-eye" data-target="loginPwd" onclick="togglePwd(this)">🙈</span>
      </div>
      <div class="login-btn-group">
        <button class="btn-primary" onclick="doLogin()" id="loginBtnText">Login</button>
        <button class="btn-third" onclick="openThirdLogin()" id="thirdLoginText">Third-party Login</button>
      </div>

      <h3 id="quickAdminTitleText" style="margin-top:20px;">Quick Admin Login</h3>
      <div class="pwd-wrap">
        <input type="password" id="quickAdminPwd" placeholder="Admin Secret Password (1234567890)">
        <span class="pwd-eye" data-target="quickAdminPwd" onclick="togglePwd(this)">🙈</span>
      </div>
      <button class="btn-quickadmin" onclick="quickAdminLogin()" id="quickAdminBtnText">Quick Admin Login</button>

      <h3 id="resetTitleText" style="margin-top:20px;">Reset All System Data</h3>
      <div class="pwd-wrap">
        <input type="password" id="resetPwd" placeholder="Reset Secret Password (xiehe2026)">
        <span class="pwd-eye" data-target="resetPwd" onclick="togglePwd(this)">🙈</span>
      </div>
      <button class="btn-reset" onclick="resetAllData()" id="resetBtnText">Reset All System Data</button>
    </div>
  </div>

  <!-- 學生 / 老師 點餐主介面 -->
  <div id="studentPage" class="hidden">
    <div class="logout-area">
      <div class="balance-box" id="balanceDisplay">Your Balance: ¥100.00</div>
      <button class="btn-grey" onclick="logout()" id="logoutText1">Logout</button>
    </div>
    <div class="card">
      <h2 id="menuTitleText">Daily Menu</h2>
      <div class="food-tab-group">
        <div class="food-tab active" data-cat="noodle" onclick="switchFoodCat('noodle')">Noodles</div>
        <div class="food-tab" data-cat="western" onclick="switchFoodCat('western')">Western Food</div>
        <div class="food-tab" data-cat="chinese" onclick="switchFoodCat('chinese')">Chinese Food</div>
        <div class="food-tab" data-cat="special" onclick="switchFoodCat('special')">Special Meal</div>
      </div>
      <div id="menuRender"></div>
      <label id="collectLabelText" style="font-weight:bold;margin-top:10px;display:block;">Choose collection time (12:00 - 13:00):</label>
      <select id="collectTime">
        <option value="12:00">12:00</option>
        <option value="12:10">12:10</option>
        <option value="12:20">12:20</option>
        <option value="12:30">12:30</option>
        <option value="12:40">12:40</option>
        <option value="12:50">12:50</option>
      </select>
      <button class="btn-success" style="margin-top:12px;width:100%;padding:13px;" onclick="submitOrder()" id="submitOrderText">Submit Pre-order</button>
    </div>
    <div class="card">
      <h2 id="myOrdersTitle">My Orders</h2>
      <div id="myOrdersList"></div>
    </div>
  </div>

  <!-- 餐廳員工介面 (Canteen Employee) -->
  <div id="canteenPage" class="hidden">
    <div class="logout-area">
      <div class="balance-box" style="background:var(--primary);" id="canteenHeaderTitle">Canteen Kitchen Management</div>
      <button class="btn-grey" onclick="logout()">Logout</button>
    </div>
    <div class="card">
      <h2>Incoming Pre-orders & Kitchen Queue</h2>
      <div id="kitchenOrderList"></div>
    </div>
    <div class="card">
      <h2>Menu Stock Management</h2>
      <div id="canteenMenuList"></div>
    </div>
  </div>

  <!-- 網站管理員介面 (Admin) -->
  <div id="adminPage" class="hidden">
    <div class="logout-area">
      <div class="balance-box" style="background:#7b61ff;">Website Administrator Portal</div>
      <button class="btn-grey" onclick="logout()">Logout</button>
    </div>
    <div class="card">
      <h2>User Account Management</h2>
      <div style="margin-bottom:12px;">
        <input type="text" id="newUsername" placeholder="New Username" style="width:30%;display:inline-block;margin-right:8px;">
        <input type="password" id="newPassword" placeholder="New Password" style="width:30%;display:inline-block;margin-right:8px;">
        <select id="newRole" style="width:25%;display:inline-block;margin-right:8px;">
          <option value="student">Student</option>
          <option value="staff">Teacher</option>
          <option value="canteen">Canteen Staff</option>
          <option value="admin">Admin</option>
        </select>
        <button class="btn-primary" onclick="addUser()" style="width:auto;">Add User</button>
      </div>
      <div id="userListContainer"></div>
    </div>
    <div class="card">
      <h2>System Overview & Analytics</h2>
      <p id="sysStatsText">Loading statistics...</p>
    </div>
  </div>
</div>

<script>
// ==================== 多語言字典 ====================
const i18n = {
  en: {
    sysTitle: "Xiehe Sanlin Bilingual School Canteen Pre-order System",
    loginTitle: "System Login",
    tabStudent: "Student",
    tabStaff: "Teacher",
    tabCanteen: "Canteen Staff",
    tabAdmin: "Admin",
    userPlaceholder: "Username",
    pwdPlaceholder: "Password",
    loginBtn: "Login",
    thirdLogin: "Third-party Login",
    quickAdminTitle: "Quick Admin Login",
    quickAdminPwd: "Admin Secret Password (1234567890)",
    quickAdmin: "Quick Admin Login",
    resetTitle: "Reset All System Data",
    resetPwd: "Reset Secret Password (xiehe2026)",
    resetBtn: "Reset All System Data",
    balance: "Your Balance: ",
    logout: "Logout",
    menu: "Daily Menu",
    collectLabel: "Choose collection time (12:00 - 13:00):",
    submitOrder: "Submit Pre-order",
    myOrders: "My Orders",
    catNoodle: "Noodles",
    catWestern: "Western Food",
    catChinese: "Chinese Food",
    catSpecial: "Special Meal"
  },
  zh: {
    sysTitle: "上海浦東新區民辦協和雙語學校食堂預訂系統",
    loginTitle: "系統登入",
    tabStudent: "學生",
    tabStaff: "老師",
    tabCanteen: "餐廳員工",
    tabAdmin: "網站管理員",
    userPlaceholder: "用戶名",
    pwdPlaceholder: "密碼",
    loginBtn: "登入",
    thirdLogin: "第三方登入",
    quickAdminTitle: "管理員一鍵快速登入",
    quickAdminPwd: "管理員安全密碼 (1234567890)",
    quickAdmin: "一鍵管理員登入",
    resetTitle: "重置所有系統數據",
    resetPwd: "重置安全密碼 (xiehe2026)",
    resetBtn: "重置系統數據",
    balance: "您的餘額: ",
    logout: "登出",
    menu: "今日菜單",
    collectLabel: "選擇取餐時間 (12:00 - 13:00):",
    submitOrder: "提交預訂訂單",
    myOrders: "我的訂單",
    catNoodle: "麵食區",
    catWestern: "西餐區",
    catChinese: "中餐區",
    catSpecial: "特色餐區"
  }
};

let currentLang = 'en';

function toggleLang() {
  currentLang = currentLang === 'en' ? 'zh' : 'en';
  document.getElementById('langSwitch').innerText = currentLang === 'en' ? '中文' : 'English';
  updateUIText();
}

function updateUIText() {
  const t = i18n[currentLang];
  document.getElementById('sysTitle').innerText = t.sysTitle;
  document.getElementById('loginTitleText').innerText = t.loginTitle;
  document.getElementById('loginUser').placeholder = t.userPlaceholder;
  document.getElementById('loginPwd').placeholder = t.pwdPlaceholder;
  document.getElementById('loginBtnText').innerText = t.loginBtn;
  document.getElementById('thirdLoginText').innerText = t.thirdLogin;
  document.getElementById('quickAdminTitleText').innerText = t.quickAdminTitle;
  document.getElementById('quickAdminPwd').placeholder = t.quickAdminPwd;
  document.getElementById('quickAdminBtnText').innerText = t.quickAdmin;
  document.getElementById('resetTitleText').innerText = t.resetTitle;
  document.getElementById('resetPwd').placeholder = t.resetPwd;
  document.getElementById('resetBtnText').innerText = t.resetBtn;
  document.getElementById('menuTitleText').innerText = t.menu;
  document.getElementById('collectLabelText').innerText = t.collectLabel;
  document.getElementById('submitOrderText').innerText = t.submitOrder;
  document.getElementById('myOrdersTitle').innerText = t.myOrders;
  document.getElementById('logoutText1').innerText = t.logout;

  // 更新登入標籤文字
  const tabs = document.querySelectorAll('.login-tab');
  if(tabs.length >= 4) {
    tabs[0].innerText = t.tabStudent;
    tabs[1].innerText = t.tabStaff;
    tabs[2].innerText = t.tabCanteen;
    tabs[3].innerText = t.tabAdmin;
  }
}

// ==================== 初始資料設定 ====================
const defaultUsers = [
  { username: "student1", password: "123", role: "student", balance: 120.0 },
  { username: "teacher1", password: "123", role: "staff", balance: 300.0 },
  { username: "canteen1", password: "123", role: "canteen", balance: 0.0 },
  { username: "admin", password: "123", role: "admin", balance: 0.0 }
];

const defaultMenu = [
  { id: 1, name: "Tonkotsu Ramen (日式豚骨拉麵)", cat: "noodle", price: 25, cal: 580, ing: "Pork bone broth, noodles, chashu, egg", nut: "High Protein, Carb", rating: 4.5, comments: [] },
  { id: 2, name: "Beef Noodles (紅燒牛肉麵)", cat: "noodle", price: 28, cal: 620, ing: "Beef brisket, hand-pulled noodles, broth", nut: "Protein, Iron", rating: 4.8, comments: [] },
  { id: 3, name: "Grilled Chicken Burger (香烤雞腿堡)", cat: "western", price: 30, cal: 520, ing: "Chicken thigh, lettuce, mayo, brioche", nut: "Balanced", rating: 4.2, comments: [] },
  { id: 4, name: "Margherita Pizza (瑪格麗特披薩)", cat: "western", price: 35, cal: 700, ing: "Tomato, mozzarella, basil", nut: "Dairy, Carb", rating: 4.6, comments: [] },
  { id: 5, name: "Sweet and Sour Pork (鍋包肉套餐)", cat: "chinese", price: 26, cal: 650, ing: "Pork, sweet & sour sauce, rice, soup", nut: "High Energy", rating: 4.7, comments: [] },
  { id: 6, name: "Mapo Tofu Set (麻婆豆腐套餐)", cat: "chinese", price: 22, cal: 480, ing: "Tofu, minced pork, spicy sauce, rice", nut: "Protein", rating: 4.3, comments: [] },
  { id: 7, name: "Chef Special Bento (營養特選便當)", cat: "special", price: 32, cal: 550, ing: "Steamed fish, broccoli, multigrain rice", nut: "Low Fat, High Vitamin", rating: 4.9, comments: [] }
];

// 初始化 LocalStorage
if (!localStorage.getItem('xiehe_users')) {
  localStorage.setItem('xiehe_users', JSON.stringify(defaultUsers));
}
if (!localStorage.getItem('xiehe_menu')) {
  localStorage.setItem('xiehe_menu', JSON.stringify(defaultMenu));
}
if (!localStorage.getItem('xiehe_orders')) {
  localStorage.setItem('xiehe_orders', JSON.stringify([]));
}
if (!localStorage.getItem('xiehe_theme')) {
  localStorage.setItem('xiehe_theme', 'default');
}

let currentUser = null;
let currentRole = 'student';
let activeCat = 'noodle';
let currentDetailFoodId = null;
let selectedThirdType = '';

// 載入儲存的主題
window.onload = function() {
  const savedTheme = localStorage.getItem('xiehe_theme') || 'default';
  document.getElementById('themeSelect').value = savedTheme;
  changeTheme(savedTheme);
  updateUIText();
};

function changeTheme(themeName) {
  document.body.className = themeName === 'default' ? '' : themeName;
  localStorage.setItem('xiehe_theme', themeName);
}

// ==================== 彈窗控制 ====================
function showModal(text) {
  document.getElementById('modalText').innerText = text;
  document.getElementById('modal').classList.remove('hidden');
}
function closeModal() {
  document.getElementById('modal').classList.add('hidden');
}

// ==================== 登入與權限切換 ====================
function switchLoginTab(role) {
  currentRole = role;
  document.querySelectorAll('.login-tab').forEach(tab => {
    if(tab.getAttribute('data-role') === role) {
      tab.classList.add('active');
    } else {
      tab.classList.remove('active');
    }
  });
}

function togglePwd(el) {
  const targetId = el.getAttribute('data-target');
  const input = document.getElementById(targetId);
  if (input.type === 'password') {
    input.type = 'text';
    el.innerText = '👁️';
  } else {
    input.type = 'password';
    el.innerText = '🙈';
  }
}

function doLogin() {
  const username = document.getElementById('loginUser').value.trim();
  const password = document.getElementById('loginPwd').value.trim();
  const users = JSON.parse(localStorage.getItem('xiehe_users'));

  const user = users.find(u => u.username === username && u.password === password && u.role === currentRole);
  if (user) {
    currentUser = user;
    enterSystem();
  } else {
    showModal("Invalid username, password, or role selection!");
  }
}

function quickAdminLogin() {
  const pwd = document.getElementById('quickAdminPwd').value;
  if (pwd === "1234567890") {
    const users = JSON.parse(localStorage.getItem('xiehe_users'));
    currentUser = users.find(u => u.role === 'admin') || { username: "admin", role: "admin", balance: 0 };
    enterSystem();
  } else {
    showModal("Incorrect Admin Secret Password!");
  }
}

function resetAllData() {
  const pwd = document.getElementById('resetPwd').value;
  if (pwd === "xiehe2026") {
    localStorage.setItem('xiehe_users', JSON.stringify(defaultUsers));
    localStorage.setItem('xiehe_menu', JSON.stringify(defaultMenu));
    localStorage.setItem('xiehe_orders', JSON.stringify([]));
    showModal("All system data has been successfully reset!");
    document.getElementById('resetPwd').value = "";
  } else {
    showModal("Incorrect Reset Secret Password!");
  }
}

// 第三方登入彈窗
function openThirdLogin() {
  document.getElementById('thirdModal').classList.remove('hidden');
  document.getElementById('qrWrap').classList.add('hidden');
  document.querySelectorAll('.third-option').forEach(opt => opt.classList.remove('active'));
}
function selectThird(type) {
  selectedThirdType = type;
  document.querySelectorAll('.third-option').forEach(opt => {
    if(opt.getAttribute('data-type') === type) opt.classList.add('active');
    else opt.classList.remove('active');
  });
  document.getElementById('qrWrap').classList.remove('hidden');
  QRCode.toCanvas(document.getElementById('qrCanvas'), `XieheCanteen_Auth_${type}_${Date.now()}`, {width: 160}, function(err){
    if(err) console.error(err);
  });
}
function refreshQr() {
  if(selectedThirdType) selectThird(selectedThirdType);
}
function closeThirdModal() {
  document.getElementById('thirdModal').classList.add('hidden');
}
function doThirdLogin() {
  // 模擬第三方授權成功，登入第一個對應角色的用戶或建立臨時用戶
  const users = JSON.parse(localStorage.getItem('xiehe_users'));
  currentUser = users.find(u => u.role === 'student') || users[0];
  closeThirdModal();
  enterSystem();
}

// 進入系統分流
function enterSystem() {
  document.getElementById('loginPage').classList.add('hidden');
  document.getElementById('studentPage').classList.add('hidden');
  document.getElementById('canteenPage').classList.add('hidden');
  document.getElementById('adminPage').classList.add('hidden');

  if (currentUser.role === 'student' || currentUser.role === 'staff') {
    document.getElementById('studentPage').classList.remove('hidden');
    const roleTitle = currentUser.role === 'staff' ? ' (Teacher)' : ' (Student)';
    document.getElementById('balanceDisplay').innerText = (currentLang === 'zh' ? '您的餘額: ' : 'Your Balance: ') + `¥${currentUser.balance.toFixed(2)}${roleTitle}`;
    renderMenu();
    renderMyOrders();
  } else if (currentUser.role === 'canteen') {
    document.getElementById('canteenPage').classList.remove('hidden');
    renderKitchenOrders();
    renderCanteenMenu();
  } else if (currentUser.role === 'admin') {
    document.getElementById('adminPage').classList.remove('hidden');
    renderUserManagement();
    renderAdminStats();
  }
}

function logout() {
  currentUser = null;
  document.getElementById('loginUser').value = '';
  document.getElementById('loginPwd').value = '';
  document.getElementById('quickAdminPwd').value = '';
  document.getElementById('resetPwd').value = '';
  document.getElementById('studentPage').classList.add('hidden');
  document.getElementById('canteenPage').classList.add('hidden');
  document.getElementById('adminPage').classList.add('hidden');
  document.getElementById('loginPage').classList.remove('hidden');
}

// ==================== 學生 / 老師 點餐邏輯 ====================
function switchFoodCat(cat) {
  activeCat = cat;
  document.querySelectorAll('.food-tab').forEach(tab => {
    if(tab.getAttribute('data-cat') === cat) tab.classList.add('active');
    else tab.classList.remove('active');
  });
  renderMenu();
}

function renderMenu() {
  const menu = JSON.parse(localStorage.getItem('xiehe_menu'));
  const container = document.getElementById('menuRender');
  container.innerHTML = '';

  const filtered = menu.filter(item => item.cat === activeCat);
  filtered.forEach(item => {
    const isStaff = currentUser && currentUser.role === 'staff';
    const finalPrice = isStaff ? item.price * 0.8 : item.price; // 老師8折優惠
    const priceDisplay = isStaff ? `<span style="text-decoration:line-through;color:#888;">¥${item.price}</span> <span style="color:var(--success);font-weight:bold;">¥${finalPrice.toFixed(1)} (Staff 20% OFF)</span>` : `¥${item.price}`;

    const row = document.createElement('div');
    row.className = 'order-row';
    row.innerHTML = `
      <div>
        <span class="food-name" onclick="openFoodDetail(${item.id})">${item.name}</span>
        <div style="font-size:13px;color:#666;">Price: ${priceDisplay} | Rating: ⭐ ${item.rating.toFixed(1)}</div>
      </div>
      <div style="display:flex;align-items:center;gap:8px;">
        <input type="number" min="0" max="5" value="0" class="quantity-input" id="qty_${item.id}">
      </div>
    `;
    container.appendChild(row);
  });
}

function submitOrder() {
  const menu = JSON.parse(localStorage.getItem('xiehe_menu'));
  const orders = JSON.parse(localStorage.getItem('xiehe_orders'));
  const collectTime = document.getElementById('collectTime').value;

  let orderedItems = [];
  let totalPrice = 0;
  const isStaff = currentUser.role === 'staff';

  menu.forEach(item => {
    const qtyInput = document.getElementById(`qty_${item.id}`);
    if (qtyInput) {
      const q = parseInt(qtyInput.value) || 0;
      if (q > 0) {
        const p = isStaff ? item.price * 0.8 : item.price;
        orderedItems.push({ id: item.id, name: item.name, qty: q, price: p });
        totalPrice += p * q;
      }
    }
  });

  if (orderedItems.length === 0) {
    showModal("Please select at least one dish!");
    return;
  }

  if (currentUser.balance < totalPrice) {
    showModal("Insufficient balance! Please top up your account.");
    return;
  }

  // 扣款並儲存訂單
  currentUser.balance -= totalPrice;
  updateUserInStorage(currentUser);

  const newOrder = {
    orderId: 'ORD' + Date.now().toString().slice(-6),
    username: currentUser.username,
    role: currentUser.role,
    items: orderedItems,
    total: totalPrice,
    time: collectTime,
    status: 'Preparing', // Preparing -> Ready -> Completed
    date: new Date().toLocaleDateString()
  };

  orders.push(newOrder);
  localStorage.setItem('xiehe_orders', JSON.stringify(orders));

  const roleTitle = currentUser.role === 'staff' ? ' (Teacher)' : ' (Student)';
  document.getElementById('balanceDisplay').innerText = (currentLang === 'zh' ? '您的餘額: ' : 'Your Balance: ') + `¥${currentUser.balance.toFixed(2)}${roleTitle}`;

  showModal(`Pre-order successful! Order ID: ${newOrder.orderId}, Total: ¥${totalPrice.toFixed(1)}`);
  renderMenu();
  renderMyOrders();
}

function renderMyOrders() {
  const orders = JSON.parse(localStorage.getItem('xiehe_orders'));
  const myOrders = orders.filter(o => o.username === currentUser.username);
  const container = document.getElementById('myOrdersList');
  container.innerHTML = '';

  if (myOrders.length === 0) {
    container.innerHTML = `<p style="color:#666;font-size:14px;">No pre-orders yet.</p>`;
    return;
  }

  myOrders.reverse().forEach(o => {
    const itemsStr = o.items.map(i => `${i.name} x${i.qty}`).join(', ');
    const div = document.createElement('div');
    div.style.cssText = "padding:10px 0;border-bottom:1px solid #eee;font-size:14px;";
    div.innerHTML = `
      <strong>Order ID:</strong> ${o.orderId} | <strong>Status:</strong> <span style="color:${o.status==='Completed'?'green':'orange'}">${o.status}</span><br>
      <strong>Items:</strong> ${itemsStr}<br>
      <strong>Total:</strong> ¥${o.total.toFixed(1)} | <strong>Collection Time:</strong> ${o.time}
    `;
    container.appendChild(div);
  });
}

// ==================== 菜品詳情與評價彈窗 ====================
function openFoodDetail(id) {
  currentDetailFoodId = id;
  const menu = JSON.parse(localStorage.getItem('xiehe_menu'));
  const food = menu.find(f => f.id === id);
  if(!food) return;

  document.getElementById('detailFoodName').innerText = food.name;
  document.getElementById('detailCal').innerText = food.cal;
  document.getElementById('detailIng').innerText = food.ing;
  document.getElementById('detailNut').innerText = food.nut;
  document.getElementById('commentInput').value = '';

  renderStars(5);
  renderComments(food.comments);

  document.getElementById('foodDetailModal').classList.remove('hidden');
}

let selectedScore = 5;
function renderStars(score) {
  selectedScore = score;
  let html = '';
  for(let i=1; i<=5; i++) {
    html += `<span class="star ${i<=score?'':'star-empty'}" onclick="renderStars(${i})">★</span>`;
  }
  document.getElementById('starBox').innerHTML = html;
}

function renderComments(comments) {
  const list = document.getElementById('commentList');
  list.innerHTML = '';
  if(!comments || comments.length === 0) {
    list.innerHTML = `<p style="font-size:13px;color:#888;">No reviews yet.</p>`;
    return;
  }
  comments.forEach(c => {
    const item = document.createElement('div');
    item.className = 'comment-item';
    item.innerHTML = `<strong style="font-size:13px;color:var(--primary);">${c.user}</strong> <span style="color:#ffb800;">${'★'.repeat(c.score)}</span><p style="font-size:13px;margin-top:2px;">${c.text}</p>`;
    list.appendChild(item);
  });
}

function submitComment() {
  const text = document.getElementById('commentInput').value.trim();
  if(!text) {
    showModal("Please write a comment!");
    return;
  }
  const menu = JSON.parse(localStorage.getItem('xiehe_menu'));
  const food = menu.find(f => f.id === currentDetailFoodId);
  if(food) {
    if(!food.comments) food.comments = [];
    food.comments.push({ user: currentUser.username, score: selectedScore, text: text });
    // 更新平均評分
    const totalScore = food.comments.reduce((sum, c) => sum + c.score, 0);
    food.rating = totalScore / food.comments.length;
    localStorage.setItem('xiehe_menu', JSON.stringify(menu));
    renderComments(food.comments);
    renderMenu();
    showModal("Comment submitted successfully!");
  }
}

function closeFoodModal() {
  document.getElementById('foodDetailModal').classList.add('hidden');
}

// ==================== 餐廳員工介面邏輯 (Canteen Employee) ====================
function renderKitchenOrders() {
  const orders = JSON.parse(localStorage.getItem('xiehe_orders'));
  const container = document.getElementById('kitchenOrderList');
  container.innerHTML = '';

  if(orders.length === 0) {
    container.innerHTML = `<p style="color:#666;font-size:14px;">No incoming orders.</p>`;
    return;
  }

  orders.forEach((o, index) => {
    const itemsStr = o.items.map(i => `${i.name} x${i.qty}`).join(', ');
    const div = document.createElement('div');
    div.style.cssText = "padding:12px 0;border-bottom:1px solid #eee;font-size:14px;display:flex;justify-content:space-between;align-items:center;flex-wrap:wrap;gap:10px;";
    div.innerHTML = `
      <div>
        <strong>[${o.orderId}]</strong> User: ${o.username} (${o.role}) | Time: ${o.time}<br>
        <strong>Items:</strong> ${itemsStr} | Status: <span style="color:var(--primary);font-weight:bold;">${o.status}</span>
      </div>
      <div>
        <button class="btn-primary" onclick="updateOrderStatus(${index}, 'Preparing')">Preparing</button>
        <button class="btn-success" onclick="updateOrderStatus(${index}, 'Ready')">Ready</button>
        <button class="btn-grey" onclick="updateOrderStatus(${index}, 'Completed')">Completed</button>
      </div>
    `;
    container.appendChild(div);
  });
}

function updateOrderStatus(index, status) {
  const orders = JSON.parse(localStorage.getItem('xiehe_orders'));
  orders[index].status = status;
  localStorage.setItem('xiehe_orders', JSON.stringify(orders));
  renderKitchenOrders();
}

function renderCanteenMenu() {
  const menu = JSON.parse(localStorage.getItem('xiehe_menu'));
  const container = document.getElementById('canteenMenuList');
  container.innerHTML = `<table><tr><th>Dish Name</th><th>Category</th><th>Price (¥)</th><th>Calories</th></tr>` +
    menu.map(m => `<tr><td>${m.name}</td><td>${m.cat}</td><td>${m.price}</td><td>${m.cal} kcal</td></tr>`).join('') +
    `</table>`;
}

// ==================== 網站管理員介面邏輯 (Admin) ====================
function renderUserManagement() {
  const users = JSON.parse(localStorage.getItem('xiehe_users'));
  const container = document.getElementById('userListContainer');
  container.innerHTML = '';

  users.forEach((u, index) => {
    const row = document.createElement('div');
    row.className = 'user-item';
    row.innerHTML = `
      <span>Username: <strong>${u.username}</strong></span>
      <span>Role: <strong>${u.role}</strong></span>
      <span>Balance: ¥${u.balance.toFixed(1)}</span>
      <button class="btn-danger" style="margin-left:auto;" onclick="deleteUser(${index})">Delete</button>
    `;
    container.appendChild(row);
  });
}

function addUser() {
  const username = document.getElementById('newUsername').value.trim();
  const password = document.getElementById('newPassword').value.trim();
  const role = document.getElementById('newRole').value;

  if(!username || !password) {
    showModal("Please enter both username and password!");
    return;
  }

  const users = JSON.parse(localStorage.getItem('xiehe_users'));
  if(users.some(u => u.username === username)) {
    showModal("Username already exists!");
    return;
  }

  users.push({ username, password, role, balance: 100.0 });
  localStorage.setItem('xiehe_users', JSON.stringify(users));
  document.getElementById('newUsername').value = '';
  document.getElementById('newPassword').value = '';
  renderUserManagement();
  showModal("User added successfully!");
}

function deleteUser(index) {
  const users = JSON.parse(localStorage.getItem('xiehe_users'));
  if(users[index].username === 'admin') {
    showModal("Cannot delete primary admin account!");
    return;
  }
  users.splice(index, 1);
  localStorage.setItem('xiehe_users', JSON.stringify(users));
  renderUserManagement();
}

function renderAdminStats() {
  const users = JSON.parse(localStorage.getItem('xiehe_users'));
  const orders = JSON.parse(localStorage.getItem('xiehe_orders'));
  const menu = JSON.parse(localStorage.getItem('xiehe_menu'));

  const totalRevenue = orders.reduce((sum, o) => sum + o.total, 0);
  const container = document.getElementById('sysStatsText');
  container.innerHTML = `
    📊 <strong>Total Registered Users:</strong> ${users.length} (Students, Teachers, Canteen Staff, Admins)<br>
    🍱 <strong>Total Menu Dishes:</strong> ${menu.length} items<br>
    🛒 <strong>Total Pre-orders Placed:</strong> ${orders.length} orders<br>
    💰 <strong>Total Canteen Revenue:</strong> ¥${totalRevenue.toFixed(1)}
  `;
}

function updateUserInStorage(updatedUser) {
  const users = JSON.parse(localStorage.getItem('xiehe_users'));
  const idx = users.findIndex(u => u.username === updatedUser.username);
  if(idx !== -1) {
    users[idx] = updatedUser;
    localStorage.setItem('xiehe_users', JSON.stringify(users));
  }
}
</script>
</body>
</html>
