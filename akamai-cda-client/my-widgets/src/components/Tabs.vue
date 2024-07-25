<template>
    <CNav variant="tabs" role="tablist" class="justify-content-end">
        <CNavLink href="#">
            Account
        </CNavLink>
        <CNavItem>
            <CNavLink href="#" active>
                Data
            </CNavLink>
        </CNavItem>
        <CNavItem>
            <CNavLink href="#">
                Devops
            </CNavLink>
        </CNavItem>
    </CNav>
    <!-- <CTabContent>
      <CTabPane role="tabpanel" aria-labelledby="contact-tab" :visible="tabPanePillsActiveKey === 3">
        Etsy mixtape wayfarers, ethical wes anderson tofu before they sold out mcsweeney's organic
        lomo retro fanny pack lo-fi farm-to-table readymade. Messenger bag gentrify pitchfork
        tattooed craft beer, iphone skateboard locavore carles etsy salvia banksy hoodie
        helvetica. DIY synth PBR banksy irony. Leggings gentrify squid 8-bit cred pitchfork.
        Williamsburg banh mi whatever gluten-free, carles pitchfork biodiesel fixie etsy retro
        mlkshk vice blog. Scenester cred you probably haven't heard of them, vinyl craft beer blog
        stumptown. Pitchfork sustainable tofu synth chambray yr.
      </CTabPane>
    </CTabContent> -->
</template>
<script>
import { CNav, CNavItem, CNavLink } from '@coreui/vue'

export default {
    components: {
        CNav,
        CNavItem,
        CNavLink
    }
}
</script>