//jshint esversion:6

const express = require("express");
const bodyParser = require("body-parser");
const ejs = require("ejs");
const _ = require("lodash");
const mysql  = require("mysql");
const { result } = require("lodash");


const app = express();
const port = process.env.PORT || 3000;
app.set('view engine', 'ejs');
app.use(bodyParser.urlencoded({extended: true}));
app.use(express.static("public"));
const db = mysql.createConnection({
  connectionLimit : 10,
  host      : 'localhost',
  user      : 'root',
  password  : '',
  database  : 'uniproject'
});
db.connect((err)=>{
  if(err) {
    throw err;
  }
  console.log('database connected');
});
var bfrom="";
var bto='';
var bcategory='';
var bticket= 0 ;
var bname='';
var name = '';
var tfrom="";
var tto='';
var tcategory='';
var tticket='';
var tname='';
var tprice=0;
var bprice= 0;
var name = '';
var phone= 0;
var email = '';
var age= '';
var password = '';
var lemail = '';
var lpassword = '';
var tseat=0;
var bseat=0;
var bnooftickets= 0;
var tnooftickets= 0;
var nprice = 1;
var text = 0;
var cemail='';
var message = '';
var cname = '';


app.get("/", function (req, res){
  res.render('login');
});
app.get("/register", function(req,res){
  res.render('register');
  
});
app.post('/', function(req,res){
  lemail = req.body.lemail;
  lpassword = req.body.lpassword;
  db.query(
    `SELECT * FROM users WHERE email=? AND password=?`,
    [lemail,lpassword],
    (err,result) => {
      if (err) {
        res.send({err: err});
      }else{
      if (result.length >0) {
        // console.log(result[0].password); 
        db.query(
          // `SELECT * FROM users WHERE email=? AND password=?`
          // `SELECT * FROM bus WHERE Bus_name=? AND Bus_category=? AND from=?`,
          `SELECT * FROM users WHERE email=? and password=? `,
          [lemail,lpassword],
          (err,result) => {
            if (err) {
              res.send({err: err});
            }else{
              // console.log(bname,bcategory,bfrom);
              name = result[0].name;
              
            }
          
        }
        );
        res.redirect('/vehicles');
      }else {
        res.redirect('/error');
      }
    }
  }
  );
  
})

app.post('/register', function(req,res){
  name = req.body.fname;
  phone= req.body.phone;
  age= req.body.age;
  email= req.body.email;
  password= req.body.password;
  // console.log(req.body.fname,req.body.email,req.body.password,req.body.phone);
  db.query(
    `INSERT INTO users (name, phone_number, age, email, password, confirm_password) VALUES (?,?,?,?,?,?)`,
    [name,phone,age,email,password,password],
    (err,result) => {
      console.log(err);
  }
  );
  res.redirect('/')
});

app.get("/vehicles", function(req,res){
  res.render('vehicles');
  
});
app.get("/bus", function(req,res){
  res.render('bus');
  
});

app.post("/bus", function(req,res){
  bfrom = req.body.bstartPoint;
  bto= req.body.busendingPoint;
  bcategory = req.body.buscategory;
  bticket = req.body.bticket;
  bname = req.body.bname;
  console.log('bus tikcet',bticket);

  db.query(
    // `SELECT * FROM users WHERE email=? AND password=?`
    // `SELECT * FROM bus WHERE Bus_name=? AND Bus_category=? AND from=?`,
    `SELECT * FROM bus WHERE Bus_name=? and bus_category=? and bfrom=? `,
    [bname,bcategory,bfrom],
    (err,result) => {
      if (err) {
        res.send({err: err});
      }else{
        console.log(bname,bcategory,bfrom);
        bseat = result[0].Seat_status;
        console.log(bseat);
      }
    
  }
  );


  res.redirect("bticket");
  
});





app.get("/train", function(req,res){
  res.render('train',{tprice});
  
});
app.post("/train", function(req,res){
  tfrom = req.body.tstartPoint;
  tto= req.body.tendingPoint;
  tcategory = req.body.tcategory;
  tticket = req.body.tticket;
  tname = req.body.tname;
  
  db.query(
    // `SELECT * FROM users WHERE email=? AND password=?`
    // `SELECT * FROM bus WHERE Bus_name=? AND Bus_category=? AND from=?`,
    `SELECT * FROM train WHERE Train_name=? and Train_class=? and tfrom=? `,
    [tname,tcategory,tfrom],
    (err,result) => {
      if (err) {
        res.send({err: err});
      }else{
        // console.log(tname,tcategory,tfrom);
        tseat = result[0].Seat_status;
        
      }
    
  }
  );
  res.redirect("tticket");
});

app.get("/bticket", function(req,res){
  res.render('busticket',{ bfrom,bto,bticket,bcategory,bname,name,bseat
  });
  
});
app.post("/bticket",function(req,res){
  bnooftickets = bseat-(parseInt(bticket));
  console.log(bnooftickets);

  if(bnooftickets>-1){
    db.query(
    
      `UPDATE Bus SET Seat_status =? WHERE  Bus_name =? and Bus_category=? and bfrom=? `,
      [bnooftickets,bname,bcategory,bfrom],
      (err,result) => {
        if (err) {
          res.send({err: err});
        }else{
          // console.log(bname,bcategory,bfrom);
          // seat = result[0].Seat_status;
          // console.log(seat);
        }
      
    }
    );
    db.query(
    
      `SELECT * from ticket_info where type like '${bcategory}' `,
      
      (err,result) => {
        if (err) {
          res.send({err: err});
        }else{
          
          
          nprice = (result[0].Price * parseInt(bticket));
          
          
        }
      
    }
    );
    db.query(
    
      `INSERT INTO payment_history (username, vehicle_name, vehicle_type, vfrom, vto, total_ticket) VALUES (?,?,?,?,?,?) `,
      [name,bname,bcategory,bfrom,bto,bticket],
      (err,result) => {
        if (err) {
          res.send({err: err});
        }else{
          // console.log(nprice);
          
          // nprice = (result[0].Price * parseInt(tticket));
          // console.log(nprice,bnooftickets);
        }
      
    }
    );
    
    
    
    
    res.redirect('bpayment');
  }else{
    res.redirect('busticketerror');
  }
  
  
});

app.get("/tticket", function(req,res){
  
  
  res.render('trainticket',{ tfrom,tto,tticket,tcategory,tname,name,tseat
  });
  
});
app.post("/tticket",function(req,res){
  tnooftickets = tseat-(parseInt(tticket));
  // console.log(nooftickets);
  if(tnooftickets>-1){
    
    db.query(
    
      `UPDATE Train SET Seat_status =? WHERE  Train_name =? and Train_class=? and tfrom=? `,
      [tnooftickets,tname,tcategory,tfrom],
      (err,result) => {
        if (err) {
          res.send({err: err});
        }else{
          // console.log(bname,bcategory,bfrom);
          // seat = result[0].Seat_status;
          // console.log(seat);
        }
        
      
    }
    );
    db.query(
    
      `SELECT * from ticket_info where type like '${tcategory}' `,
      
      (err,result) => {
        if (err) {
          res.send({err: err});
        }else{
          
          
          nprice = (result[0].Price * parseInt(tticket));
          console.log(nprice,bnooftickets);
        }
      
    }
    );
    db.query(
    
      `INSERT INTO payment_history (username, vehicle_name, vehicle_type, vfrom, vto, total_ticket) VALUES (?,?,?,?,?,?) `,
      [name,tname,tcategory,tfrom,tto,tticket],
      (err,result) => {
        if (err) {
          res.send({err: err});
        }else{
          // console.log(nprice);
          
          // nprice = (result[0].Price * parseInt(tticket));
          // console.log(nprice,bnooftickets);
        }
      
    }
    );
    res.redirect('tpayment');
  }else{
    res.redirect('trainticketerror');
  }
  
});

app.get("/tpayment", function(req,res){
  res.render('trainpayment',{ tfrom,tto,tticket,tcategory,tname,name,nprice,tcategory
  });
  
});

app.get("/bpayment", function(req,res){
  
  res.render('buspayment',{ bfrom,bto,bticket,bcategory,bname,name,nprice,bcategory
  });
  
  
});

app.get("/error", function(req,res){
  res.render('loginerror');
  
});

app.get("/trainticketerror", function(req,res){
  res.render('trainticketerror',{tseat});
  
});
app.get("/busticketerror", function(req,res){
  res.render('busticketerror',{bseat});
  
});
 
app.get("/contact", function(req,res){
  res.render('contact');
  
});
app.post("/contact", function(req,res){
  cname = req.body.cname;
  cemail= req.body.cemail;
  message= req.body.message;
  
  db.query(
    
    `INSERT INTO contact_us (name, email, message) VALUES (?,?,?) `,
    [cname, cemail, message],
    (err,result) => {
      if (err) {
        res.send({err: err});
      }else{
        // console.log(nprice);
        
        // nprice = (result[0].Price * parseInt(tticket));
        // console.log(nprice,bnooftickets);
      }
    
  }
  );
  res.redirect('/');
  
});





app.listen(port, function() {
  console.log("Server started on port 3000");
});
