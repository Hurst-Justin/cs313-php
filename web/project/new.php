<?php
    require "dbConnect.php";
    $db = get_db();
?>

<!DOCTYPE html>
<html>
    <head>
        <title>Incident Management System</title>
        <link rel="stylesheet" type="text/css" href="mystyles.css">
        <script type="text/javascript" src="scripts.js"></script>  
    </head>

    <body>
    <h1>Incident Management System</h1>
    <div class="topnav">
        <a class="active" href="index.php">Home</a>
        <a class="active" href="new.php">Create New Event</a>
        <a class="active" href="search.php">Search</a>
    </div>
    <h2>New Event Record</h2>
    <form method="post" action="new-record.php">
   
    <h3>Event Details:</h3>
    <p>
    <b>Date Event Occurred: </b> 
    <input required type="date" name="dateOccurred"><br/>
    

    <b>Date Event Reported: </b> 
    <input required type="date" name="dateReported"><br/>
    
    <b>Short Description: </b> <br/>
    <!--<input required type="textarea" rows="2" cols="100" name="shortDescription"><br/>-->
    ​<textarea required name="shortDescription" rows="2" cols="100"></textarea><br/>

    <b>Detailed Description: </b> <br/>
    <!--<input required type="textarea" rows="4" cols="100" name="longDescription"><br/>-->
    <textarea required name="longDescription" rows="6" cols="100"></textarea><br/>

    <b>Site: </b> 
        <select required name="siteID">
        <option value="" selected disabled hidden></option>
        <?php
            $stmt = $db->prepare('select * from sites');
            $stmt->execute();
            $rows = $stmt->fetchAll(PDO::FETCH_ASSOC);
            foreach ($rows as $row)
            {
                $site = $row['site_label'];
                $siteID = $row['site_id'];
                echo '<option value="'.$siteID.'">'.$site.'</option>';
            }
        ?>
        </select>
        <br/>
    <b>Department: </b> 
        <select required name="departmentID">
        <option value="" selected disabled hidden></option>
        <?php
            $stmt = $db->prepare('select * from departments');
            $stmt->execute();
            $rows = $stmt->fetchAll(PDO::FETCH_ASSOC);
            foreach ($rows as $row)
            {
                $department = $row['department_label'];
                $departmentID = $row['department_id'];
                echo '<option value="'.$departmentID.'">'.$department.'</option>';
            }
        ?>
        </select>
        <br/>
    <b>Actual Severity of Event: </b> 
        <select required name="severityID_Act">
        <option value="" selected disabled hidden></option>
        <?php
            $stmt = $db->prepare('select * from severities');
            $stmt->execute();
            $rows = $stmt->fetchAll(PDO::FETCH_ASSOC);
            foreach ($rows as $row)
            {
                $severity = $row['severity_label'];
                $severityID = $row['severity_id'];
                echo '<option value="'.$severityID.'">'.$severity.'</option>';
            }
        ?>
        </select>
        <br/>
    <b>Probable Severity of Event: </b> 
        <select required name="severityID_Prob">
        <option value="" selected disabled hidden></option>
        <?php
            $stmt = $db->prepare('select * from severities');
            $stmt->execute();
            $rows = $stmt->fetchAll(PDO::FETCH_ASSOC);
            foreach ($rows as $row)
            {
                $severity = $row['severity_label'];
                $severityID = $row['severity_id'];
                echo '<option value="'.$severityID.'">'.$severity.'</option>';
            }
        ?>
        </select>
        <br/>
    <b>Temperature: </b> 
    <input required type="number" rows="4" cols="100" name="temperature"><br/>
    
    <b>Unit of Measure: </b> 
        <select required name="tempUOMID">
        <option value="" selected disabled hidden></option>
        <?php
            $stmt = $db->prepare('select * from temperature_uoms');
            $stmt->execute();
            $rows = $stmt->fetchAll(PDO::FETCH_ASSOC);
            foreach ($rows as $row)
            {
                $temperature = $row['temperature_uom_label'];
                $temperatureID = $row['temperature_uom_id'];
                echo '<option value="'.$temperatureID.'">'.$temperature.'</option>';
            }
        ?>
        </select>
        <br/>

    <b>Weather Conditions: </b> 
        <select required name="weatherID">
        <option value="" selected disabled hidden></option>
        <?php
            $stmt = $db->prepare('select * from weathers');
            $stmt->execute();
            $rows = $stmt->fetchAll(PDO::FETCH_ASSOC);
            foreach ($rows as $row)
            {
                $weather = $row['weather_label'];
                $weatherID = $row['weather_id'];
                echo '<option value="'.$weatherID.'">'.$weather.'</option>';
            }
        ?>
        </select>
        <br/>

    <b>Lighting Conditions: </b> 
        <select required name="lightingID">
        <option value="" selected disabled hidden></option>
        <?php
            $stmt = $db->prepare('select * from lightings');
            $stmt->execute();
            $rows = $stmt->fetchAll(PDO::FETCH_ASSOC);
            foreach ($rows as $row)
            {
                $lighting = $row['lighting_label'];
                $lightingID = $row['lighting_id'];
                echo '<option value="'.$lightingID.'">'.$lighting.'</option>';
            }
        ?>
        </select>
        <br/>
    <b>Type of Activity At Time of Event: </b> 
        <select required name="activityID">
        <option value="" selected disabled hidden></option>
        <?php
            $stmt = $db->prepare('select * from activity_types');
            $stmt->execute();
            $rows = $stmt->fetchAll(PDO::FETCH_ASSOC);
            foreach ($rows as $row)
            {
                $activity = $row['activity_type_label'];
                $activityID = $row['activity_type_id'];
                echo '<option value="'.$activityID.'">'.$activity.'</option>';
            }
        ?>
        </select>
        <br/>
    <!--Entered By Hidden, may enable login functionality, but defaulted to ID 1 for now-->
        <input type="hidden" name="enteredID" value="1">
    <b>Reported By: </b> 
        <select required name="reportedID">
        <option value="" selected disabled hidden></option>
        <?php
            $stmt = $db->prepare('select * from users');
            $stmt->execute();
            $rows = $stmt->fetchAll(PDO::FETCH_ASSOC);
            foreach ($rows as $row)
            {
                $user = $row['user_name_last'].', '. $row['user_name_first'];
                $userID = $row['user_id'];
                echo '<option value="'.$userID.'">'.$user.'</option>';
            }
        ?>
        </select>
        <br/>
    <b>QA/QC By: </b> 
        <select required name="qaqcID">
        <option value="" selected disabled hidden></option>
        <?php
            $stmt = $db->prepare('select * from users');
            $stmt->execute();
            $rows = $stmt->fetchAll(PDO::FETCH_ASSOC);
            foreach ($rows as $row)
            {
                $user = $row['user_name_last'].', '. $row['user_name_first'];
                $userID = $row['user_id'];
                echo '<option value="'.$userID.'">'.$user.'</option>';
            }
        ?>
        </select>
        <br/>

    <b>Equipment Type: </b> 
        <select required name="equipmentID">
        <option value="" selected disabled hidden></option>
        <?php
            $stmt = $db->prepare('select * from equipments');
            $stmt->execute();
            $rows = $stmt->fetchAll(PDO::FETCH_ASSOC);
            foreach ($rows as $row)
            {
                $equipment = $row['equipment_label'];
                $equipmentID = $row['equipment_id'];
                echo '<option value="'.$equipmentID.'">'.$equipment.'</option>';
            }
        ?>
        </select>
        <br/>
    <b>Within Reporting Boundary?: </b> 
        <select required name="boundaryID">
        <option value="1" selected>Yes</option>
        <option value="0">No</option>
        </select>
        <br/>


    </p>
    <h3>Consequence Details:</h3>
    <p>
    <b>Consequence Type: </b> 
        <select required name="consequenceID">
        <option value="" selected disabled hidden></option>
        <?php
            $stmt = $db->prepare('select * from consequence_types');
            $stmt->execute();
            $rows = $stmt->fetchAll(PDO::FETCH_ASSOC);
            foreach ($rows as $row)
            {
                $consequence = $row['consequence_type_label'];
                $consequenceID = $row['consequence_type_id'];
                echo '<option value="'.$consequenceID.'">'.$consequence.'</option>';
            }
        ?>
        </select>
        <br/>
    <b>Injury Description: </b> 
        <input required type="textarea" rows="2" cols="100" name="injuryDescription"><br/>
        <br/>
    
    </p>

    <input type="submit" value="Submit">
    </form>
    </body>
</html>