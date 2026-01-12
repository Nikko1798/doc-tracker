<table width="100%">
    <tr>
        <!-- IMAGE COLUMN -->
        <td width="30%" align="center" valign="top">
            <img
                src="{{ $image }}"
                style="
                    width: 170px;
                    height: 170px;
                    border: 1px solid #000;
                    object-fit: cover;
                "
            >
            <div style="margin-top: 6px; font-size: 12px;">
                Legal Section - Document Tracker
            </div>
        </td>

        <!-- DETAILS COLUMN -->
        <td width="70%" valign="top">
            <strong>Project/Program: </strong> {{ $title }}<br><br>
            <strong>Date received: </strong> {{ $date_received }}<br><br>
            <strong>Conrol Number: </strong> {{ $control_number }}
        </td>
    </tr>
</table>
