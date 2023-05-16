<!doctype html>
<html lang="en">
   <head>
      <!-- Required meta tags -->
      <meta charset="utf-8">
      <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
      <title>Mobile Physician - Intake Form</title>
      <style>
         label {
         margin-top: 6px;
         padding-top: 5px;
         }
         p.data {
         background-color: #f1f1f1;
         }
      </style>
   </head>
   <body>
      <table style="font-size: 13px; margin-top: 230px;" cellpadding="3">
         <tbody>
            <tr>
               <td colspan="2" width="488px"  height="10px" style="font-size: 12px;">
               </td>
            </tr>
            <tr>
               <td width="295px" >
               </td>
               <td width="173px" height="20px"  colspan="3" >
                <?= date('m/d/Y', strtotime($date_of_sent)) ?>
               </td>
               <td width="200px" >
               </td>
            </tr>
            <tr>
               <td colspan="2" width="488px"  height="5px" style="font-size: 1px;">
               </td>
            </tr>
            <tr>
               <td colspan="2" width="488px"  height="10px" style="font-size: 3px;">
               </td>
               <td width="173px" height="10px">
               </td>
            </tr>
            <tr>
               <td colspan="2" width="488px"  height="5px" style="font-size: 3px;">
               </td>
               <td width="173px" height="5px">
               </td>
            </tr>
            <tr>
               <td colspan="2" width="505px"  height="20px">
                <?='<label>  </label>'.$pi_patient_name?>
               </td>
               <td width="173px" height="20px">
               <?=date('m/d/Y', strtotime($pi_dob))?>
               </td>
            </tr>
            <tr>
               <td colspan="2" width="488px"  height="23px"  style="font-size: 13px;">
               </td>
               <td width="173px" height="23px"  style="font-size: 13px;">
               </td>
            </tr>
            <tr>
               <td width="66px" height="48px">
               <?php 
                  if($pi_gender == 'male'){
                    echo '<b>X</b>';
                  }
                  
                  ?>
               </td>
               <td width="100px" height="48px">
               <?php 
                  if($pi_gender == 'female'){
                    echo '<b>X</b>';
                  }
                  
                  ?>
               </td>
               <td width="240px">
               <?=$pi_phone?>
               </td>
               <td width="173px">
               <?=$pi_language?>
               </td>
            </tr>
            <tr>
               <td colspan="3" width="520px" height="18px">
               <?='<label>  </label>'.$pi_address?>
               </td>
            </tr>
            <tr>
               <td colspan="3" width="520px" height="18px">
               </td>
            </tr>
            <tr>
               <td colspan="3" width="520px" height="15px" style="font-size: 8px; ">
               </td>
            </tr>
            <tr>
               <td colspan="3" width="520px" height="18px" style="font-size: 11px; ">
               </td>
            </tr>
            <tr>
               <td colspan="3" width="520px" height="18px" style="font-size: 11px; ">
               </td>
            </tr>
            <tr>
               <td colspan="2" width="338px"  height="20px">
                  
                     <?php
                  if($ii_medicare){
                     echo '<label>  </label>'.$ii_medicare;
                  } else {
                     echo '<br>';
                  }
                  ?>
                  
               </td>
               <td width="173px" height="20px">
                  
                  <?php
                  if($ii_ssn){
                     echo '<label>  </label>'.$ii_ssn;
                  } else {
                     echo '<br>';
                  }
                  ?>
               
               </td>
            </tr>
            <tr>
               <td colspan="3" width="520px" height="18px">
               </td>
            </tr>
            <tr>
               <td colspan="" width="205px" height="18px">
                  <label></label><br>
                  <label></label><br>
                  <?php 
                  if($tov == 'Home Visit (Physical)'){
                    echo '<b> X</b>';
                  }
                  
                  ?>
               </td>
               <td colspan="" width="126px" height="18px">
                  <label></label><br>
                  <label></label><br>
                  <?php 
                  if($tov == 'Telehealth'){
                    echo '<b> X</b>';
                  }
                  
                  ?>
               </td>
               <td colspan="" width="200px" height="18px">
                  <label></label><br>
                  <label></label><br>
                  <?php 
                  if($tov == 'Either'){
                    echo '<b>X</b>';
                  }
                  
                  ?>
               </td>
            </tr>
            <tr>
               <td colspan="3" width="520px" height="20px" style="font-size: 20px; ">
               </td>
            </tr>
            <tr>
               <td colspan="3" width="520px" height="18px" style="font-size: 16px; ">
               </td>
            </tr>
      
            <tr>
               <td colspan="" width="200px" height="18px" style="font-size: 14px; ">
               <?php 
                  if($rvr_reason_for_visit == 'Referral from Home Health'){
                    echo '<b> X</b>';
                  }
                  
                  ?>
               
               </td>
               <td colspan="" width="289px" height="18px" style="font-size: 14px; ">
               <?php 
                  if($rvr_reason_for_visit == 'Discharged from Hospital'){
                    echo '<b> X</b>';
                  }
                  
                  ?>
               </td>
               <td colspan="" width="100px" height="18px">
               <?php
               if($rvr_reason_for_visit == 'Discharged from Hospital'){
                echo date('m/d/Y', strtotime($rvr_date_discharged));
               }
               ?>
               </td>
            </tr>
            <tr>
               <td colspan="" width="265px" height="15px" style="font-size: 14px; ">
               <?php 
                  if($rvr_reason_for_visit == 'Follow-up Visit'){
                    echo '<b> X</b>';
                  }
                  
                  ?>
               </td>
               <td colspan="" width="285px" height="15px" valign="top">
               <?=$rvr_hospital?>
               </td>
            </tr>
            <tr>
               <td colspan="" width="205px" height="15px" style="font-size: 14px; ">
               <?php 
                  if($rvr_reason_for_visit == 'Transfer of Care'){
                    echo '<b>X</b>';
                  }
                  
                  ?>
               </td>
               <td colspan="" width="285px" height="15px" valign="top" style="font-size: 14px; ">
               <?php 
                  if($rvr_reason_for_visit == 'Other Reason'){
                    echo '<b>X</b>';
                  }
                  
                  ?>
               </td>
            </tr>
            <tr>
               <td colspan="" width="265px" height="15px" style="font-size: 14px; ">
               </td>
               <td colspan="" width="285px" height="15px" valign="top" style="font-size: 14px; ">
               <b><?=$rvr_reason_for_visit_request?></b>
               </td>
            </tr>
            <tr>
               <td colspan="3" height="15px" style="font-size: 1px; ">
               </td>
            </tr>
            <tr>
               <td colspan="3" height="15px" style="font-size: 11px; ">
               <?php
                if($rvr_additional_comment){
                  echo '<label>  </label>'.$rvr_additional_comment;
                } else {
                  echo '<br>';
                }
               ?>
                  <br>
                  <br>
               </td>
            </tr>

            <?php
                if(strlen($rvr_additional_comment) < 130){
                  ?>
                  <tr>
                     <td colspan="3" height="15px" style="font-size: 10px; ">
                     </td>
                  </tr>
                  <tr>
                     <td colspan="3" height="15px" style="font-size: 1px; ">
                     </td>
                  </tr>
                  <?php
                } else {
                  ?>
                  <tr>
                     <td colspan="3" height="16px" style="font-size: 5px; ">
                     </td>
                  </tr>
                  <?php
                }
               ?>
          
            
            
            <tr>
               <td colspan="3" height="15px" style="font-size: 5px; ">
               </td>
            </tr>
            <tr>
               <td colspan="3" height="15px">
               </td>
            </tr>
            <tr>
               <td height="15px" width="456px">
               <?='<label>  </label>'.$pf_name_of_facility?>
               </td>
               <td  height="15px">
               <?=$pf_contact_person?>
               </td>
            </tr>
            <tr>
               <td colspan="3" width="520px" height="18px" style="font-size: 15px; ">
               </td>
            </tr>
            <tr>
               <td width="231px" height="18px">
               <?='<label>  </label>'.$pf_phone?>
               </td>
               <td width="180px" height="18px">
               <?=$pf_fax?>
               </td>
               <td width="260px" height="18px">
               <?=$pf_email?>
               </td>
            </tr>
            <tr>
               <td colspan="3" width="520px" height="18px" style="font-size: 16px;">
               </td>
            </tr>
            <tr>
               <td colspan="3" height="18px" >
               <?='<label>  </label>'.$pf_address?>
               </td>
            </tr>
            <tr>
               <td colspan="3" height="18px"  style="font-size: 10px;" >
               </td>
            </tr>
            <tr>
               <td colspan="3" height="18px" style="font-size: 10px;" >
               </td>
            </tr>
            <tr>
               <td colspan="3" height="12px" style="font-size: 5px;" >
               </td>
            </tr>
            <tr>
               <td colspan="3" >
               <?php 
                  echo $mds[$preferred_smd];
                  
                  ?>
               </td>
            
               
            </tr>

            <tr>
               <td colspan="3" >
               <?php 
                  echo "NPI #:".$npi[$preferred_smd];
                  
                  ?>
               </td>
            
               
            </tr>
         </tbody>
      </table>
   </body>
</html>