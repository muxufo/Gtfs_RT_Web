package com.nicolas.model;

/**
 * Created by David on 2017-04-04.
 */

import com.google.transit.realtime.GtfsRealtime;
import com.google.transit.realtime.GtfsRealtime.FeedEntity;
import com.google.transit.realtime.GtfsRealtime.FeedMessage;

import java.io.IOException;
import java.net.URL;
import java.util.ArrayList;

/**
 * Hello world!
 */
public class Model {
    /**
     * Feed postition
     */
    private static ArrayList<String> trip = new ArrayList<String>();
    private static ArrayList<String> vehicle = new ArrayList<String>();
    private static ArrayList<String> position = new ArrayList<String>();
    private static ArrayList<Integer> current_stop_sequence = new ArrayList<Integer>();
    private static ArrayList<String> stop_id = new ArrayList<String>();
    private static ArrayList<String> current_status = new ArrayList<String>();
    private static ArrayList<Long> timestampPose = new ArrayList<Long>();
    private static ArrayList<String> congestion_level = new ArrayList<String>();
    private static ArrayList<String> occupacy_level = new ArrayList<String>();


    /**
     * Feed trip update
     */
    private static ArrayList<String> tripUpdate = new ArrayList<String>();
    private static ArrayList<String> vehicleUpdate = new ArrayList<String>();
    private static ArrayList<String> stopTimeUpdate = new ArrayList<String>();
    private static ArrayList<Long> timestampUpdate = new ArrayList<Long>();
    private static ArrayList<Integer> delayUpdate = new ArrayList<Integer>();


    /**
     * Feed alert
     */
    private static ArrayList<String> active_period = new ArrayList<String>();
    private static ArrayList<String> informed_entity = new ArrayList<String>();
    private static ArrayList<String> cause = new ArrayList<String>();
    private static ArrayList<String> effect = new ArrayList<String>();
    private static ArrayList<String> url_alert = new ArrayList<String>();
    private static ArrayList<String> header_text = new ArrayList<String>();
    private static ArrayList<String> description_text = new ArrayList<String>();


    private static String urlPosition;
    private String urlTrip;
    private String urlAlert;
    private static String urlPositionStatic;

    /**
     * Getter et Setter des differents URL
     *
     * @return
     */

    public String getUrlAlert() {
        return urlAlert;
    }

    public void setUrlAlert(String urlAlert) throws IOException {
        FeedAlert(urlAlert);
        this.urlAlert = urlAlert;
    }


    public String getUrlPosition() {
        return urlPosition;
    }

    public static String getUrlPositionStatic() {
        return urlPositionStatic;
    }

    public void setUrlPosition(String urlPosition) throws IOException {
        Model.urlPosition = urlPosition;
        urlPositionStatic = urlPosition;
    }

    public String getUrlTrip() {
        return urlTrip;
    }

    public void setUrlTrip(String urlTrip) throws IOException {
        FeedTripUpdate(urlTrip);
        this.urlTrip = urlTrip;
    }

    /**
     * Getter des listes contenant les donnees
     *
     * @return
     */

    public static ArrayList<String> getTrip() {
        return trip;
    }

    public static ArrayList<String> getVehicle() {
        return vehicle;
    }

    public static ArrayList<String> getPosition() {
        return position;
    }

    public static ArrayList<Integer> getCurrent_stop_sequence() {
        return current_stop_sequence;
    }

    public static ArrayList<String> getStop_id() {
        return stop_id;
    }

    public static ArrayList<String> getCurrent_status() {
        return current_status;
    }

    public static ArrayList<Long> getTimestampPose() {
        return timestampPose;
    }

    public static ArrayList<String> getCongestion_level() {
        return congestion_level;
    }

    public static ArrayList<String> getTripUpdate() {
        return tripUpdate;
    }

    public static ArrayList<String> getVehicleUpdate() {
        return vehicleUpdate;
    }

    public static ArrayList<String> getOccupacy_level() {
        return occupacy_level;
    }

    public static ArrayList<String> getStopTimeUpdate() {
        return stopTimeUpdate;
    }

    public static ArrayList<Long> getTimestampUpdate() {
        return timestampUpdate;
    }

    public static ArrayList<Integer> getDelayUpdate() {
        return delayUpdate;
    }

    public static ArrayList<String> getActive_period() {
        return active_period;
    }

    public static ArrayList<String> getInformed_entity() {
        return informed_entity;
    }

    public static ArrayList<String> getCause() {
        return cause;
    }

    public static ArrayList<String> getEffect() {
        return effect;
    }

    public static ArrayList<String> getUrl_alert() {
        return url_alert;
    }

    public static ArrayList<String> getHeader_text() {
        return header_text;
    }

    public static ArrayList<String> getDescription_text() {
        return description_text;
    }

    public static Float getLongitude(FeedEntity entity) throws IOException {
        return entity.getVehicle().getPosition().getLongitude();
    }

    public static Float getLatitude(FeedEntity entity) throws IOException {
        return entity.getVehicle().getPosition().getLatitude();
    }

    public static String getLabel(FeedEntity entity) throws IOException {
        return entity.getVehicle().getVehicle().getLabel();
    }

    /**
     * LISTS CLEAR AND FILL
     *
     * @throws IOException
     */

    public void RemplirListePose() throws IOException {
        FeedPosition(getUrlPosition());
    }

    public static void ViderListePose() {
        getTrip().clear();
        getVehicle().clear();
        getPosition().clear();
        getCurrent_stop_sequence().clear();
        getStop_id().clear();
        getCurrent_status().clear();
        getTimestampPose().clear();
        getCongestion_level().clear();
        getOccupacy_level().clear();
    }


    public static void ViderListeTripUpdate() {
        tripUpdate.clear();
        vehicleUpdate.clear();
        stopTimeUpdate.clear();
        timestampUpdate.clear();
        delayUpdate.clear();
    }

    public void RemplirListeTripUpdate() throws IOException {
        FeedTripUpdate(getUrlTrip());
    }

    public static void ViderListeAlert() {
        active_period.clear();
        informed_entity.clear();
        cause.clear();
        effect.clear();
        url_alert.clear();
        header_text.clear();
        description_text.clear();
    }


    public void RemplirListeAlert() throws IOException {
        FeedAlert(getUrlAlert());
    }

    /**
     * FEED DU TRIP UPDATE
     * Pour les listes je pars du principe que si une info n'est pas dans un bus, alors elle n'y sera dans aucun autre
     *
     * @param _urlTrip
     * @throws IOException
     */

    private void FeedTripUpdate(String _urlTrip) throws IOException {
        URL urlUpdate = new URL(_urlTrip);
        FeedMessage feed = FeedMessage.parseFrom(urlUpdate.openStream());
        for (FeedEntity entity : feed.getEntityList()) {
            if (!entity.hasTripUpdate()) {
                break;
            }
            if (entity.getTripUpdate().hasTrip()) tripUpdate.add(entity.getTripUpdate().getTrip().toString());
            if (entity.getTripUpdate().hasVehicle()) vehicleUpdate.add(entity.getTripUpdate().getVehicle().toString());
            if (!(entity.getTripUpdate().getStopTimeUpdateList() == null)) {
                for (GtfsRealtime.TripUpdate.StopTimeUpdate entity1 : entity.getTripUpdate().getStopTimeUpdateList()) {
                    stopTimeUpdate.add(entity1.toString());
                }
            }
            if (entity.getTripUpdate().hasTimestamp()) timestampUpdate.add(entity.getTripUpdate().getTimestamp());
            if (entity.getTripUpdate().hasDelay()) delayUpdate.add(entity.getTripUpdate().getDelay());
        }
    }

    /**
     * FEED DE LA POSITION DU VEHICULE
     * Pour les listes je pars du principe que si une info n'est pas dans un bus, alors elle n'y sera dans aucun autre
     *
     * @param _urlPosition
     * @throws IOException
     */
    private static void FeedPosition(String _urlPosition) throws IOException {
        URL urlPosition = new URL(_urlPosition);
        FeedMessage feed = FeedMessage.parseFrom(urlPosition.openStream());
        /**
         * Remplissage des listes avec les infos des donnees dans le feed
         */
        for (FeedEntity entity : feed.getEntityList()) {
            if (!entity.hasVehicle()) {
                break;
            }
            if (entity.getVehicle().hasTrip()) trip.add(entity.getVehicle().getTrip().toString());
            if (entity.getVehicle().hasVehicle()) vehicle.add(entity.getVehicle().getVehicle().toString());
            if (entity.getVehicle().hasPosition()) position.add(entity.getVehicle().getPosition().toString());
            if (entity.getVehicle().hasCurrentStopSequence())
                current_stop_sequence.add(entity.getVehicle().getCurrentStopSequence());
            if (entity.getVehicle().hasStopId()) stop_id.add(entity.getVehicle().getStopId());
            if (entity.getVehicle().hasCurrentStatus())
                current_status.add(entity.getVehicle().getCurrentStatus().toString());
            if (entity.getVehicle().hasTimestamp()) timestampPose.add(entity.getVehicle().getTimestamp());
            if (entity.getVehicle().hasCongestionLevel())
                congestion_level.add(entity.getVehicle().getCongestionLevel().toString());
            if (entity.getVehicle().hasOccupancyStatus())
                occupacy_level.add(entity.getVehicle().getOccupancyStatus().toString());
        }
    }

    /**
     * FEED DES ALERTES
     * Pour les listes je pars du principe que si une info n'est pas dans un bus, alors elle n'y sera dans aucun autre
     *
     * @param _urlAlert
     * @throws IOException
     */
    private void FeedAlert(String _urlAlert) throws IOException {
        URL urlAlert = new URL(_urlAlert);
        FeedMessage feed = FeedMessage.parseFrom(urlAlert.openStream());

        /**
         * Remplissage des listes avec les infos des donnees dans le feed
         */

        for (FeedEntity entity : feed.getEntityList()) {
            if (!entity.hasAlert()) break;

            if (!(entity.getAlert().getActivePeriodList() == null)) {
                for (GtfsRealtime.TimeRange entity1 : entity.getAlert().getActivePeriodList()) {
                    active_period.add(entity1.toString());
                }
            }
            if (!(entity.getAlert().getInformedEntityList() == null)) {
                for (GtfsRealtime.EntitySelector entity1 : entity.getAlert().getInformedEntityList()) {
                    informed_entity.add(entity1.toString());
                }
            }
            if (entity.getAlert().hasCause()) cause.add(entity.getAlert().getCause().toString());
            if (entity.getAlert().hasEffect()) effect.add(entity.getAlert().getEffect().toString());
            if (entity.getAlert().hasUrl()) url_alert.add(entity.getAlert().getUrl().toString());
            if (entity.getAlert().hasHeaderText()) header_text.add(entity.getAlert().getHeaderText().toString());
            if (entity.getAlert().hasDescriptionText())
                description_text.add(entity.getAlert().getDescriptionText().toString());
        }
    }

}